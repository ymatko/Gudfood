table 50104 "Posted Gudfood Order Line"
{
    Caption = 'Posted Gudfood Order Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            DataClassification = CustomerContent;
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
            CalcFormula = lookup("Posted Gudfood Order Header"."Sell-to Customer No.");

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
    trigger OnInsert()
    begin
        if Quantity < 0 then
            Error(CannotBeLessErr, 0);
    end;

    var
        CannotBeLessErr: Label 'The value cannot be less than %1';
}
