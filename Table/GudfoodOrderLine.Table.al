table 50103 "Gudfood Order Line"
{
    Caption = 'Gudfood Order Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            DataClassification = CustomerContent;
            TableRelation = "Gudfood Order Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            FieldClass = FlowField;
            CalcFormula = lookup("Gudfood Order Header"."Sell-to Customer No." where("No." = field("Order No.")));

        }
        field(4; "Date Created"; Date)
        {
            Caption = 'Date Created';
            DataClassification = CustomerContent;
        }
        field(5; "Gudfood Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            TableRelation = "Gudfood Item";
            trigger OnValidate()
            begin
                UpdateLine();
            end;
        }
        field(6; "Item Type"; Enum "Type of meal")
        {
            Caption = 'Item Type';
            FieldClass = FlowField;
            CalcFormula = Lookup("Gudfood Item".Type where(Code = field("Gudfood Item No.")));
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(8; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                UpdateLine();
            end;
        }
        field(9; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
        }
        field(10; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Order No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnModify()
    begin
        UpdateLine();
    end;

    trigger OnDelete()
    begin
        UpdateLine();
    end;

    local procedure UpdateLine()
    var
        GudfoodOrderHeader: Record "Gudfood Order Header";
        Item: Record "Gudfood Item";
    begin
        if GudfoodOrderHeader.Get("Order No.") then
            Rec."Date Created" := GudfoodOrderHeader."Date Created";
        if Item.Get("Gudfood Item No.") then begin
            Rec.Description := Item.Description;
            Rec."Unit Price" := Item."Unit Price";
        end;
        Rec.Amount := Rec.Quantity * Rec."Unit Price";
    end;
}
