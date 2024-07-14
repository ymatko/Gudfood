table 50100 "Gudfood Item"
{
    Caption = 'Gudfood Item';
    DataClassification = CustomerContent;
    DrillDownPageId = "Gudfood Item Card";
    LookupPageId = "Gudfood Item List";

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                TestNoSeries();
            end;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(4; Type; Enum "Type of Meal")
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
        }
        field(5; "Qty. Ordered"; Decimal)
        {
            Caption = 'Qty. Ordered';
            FieldClass = FlowField;
            DecimalPlaces = 0 : 0;
            Editable = false;
            CalcFormula = sum("Posted Gudfood Order Line".Quantity where("Gudfood Item No." = field(Code)));
        }
        field(6; "Qty. in Order"; Decimal)
        {
            Caption = 'Qty. in Order';
            FieldClass = FlowField;
            DecimalPlaces = 0 : 0;
            Editable = false;
            CalcFormula = sum("Gudfood Order Line".Quantity where("Gudfood Item No." = field(Code)));
        }
        field(7; "Shelf Life"; Date)
        {
            Caption = 'Shelf Life';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(8; Picture; Media)
        {
            Caption = 'Picture';
            DataClassification = CustomerContent;
        }
        field(9; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(10; "Item No."; Code[20])
        {
            TableRelation = Item;
            Caption = 'Item No.';
            NotBlank = true;
        }
    }
    keys
    {
        key(PK; code)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
    begin
        if Code = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Gudfood Item No.");
            if NoSeries.AreRelated(SalesSetup."Gudfood Item No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series"
            else
                "No. Series" := SalesSetup."Gudfood Item No.";
            Code := NoSeries.GetNextNo("No. Series");
        end;
    end;

    trigger OnDelete()
    begin
        Rec.CalcFields("Qty. in Order", "Qty. Ordered");
        if Rec."Qty. Ordered" > 0 then
            Error(IsUsdErr);
        if Rec."Qty. in Order" > 0 then
            Error(IsUsdErr);
    end;

    local procedure TestNoSeries()
    var
        Item: Record "Gudfood Item";
    begin
        if Rec.Code <> xRec.Code then begin
            if not Item.Get(Rec.Code) then begin
                SalesSetup.Get();
                SalesSetup.TestField("Gudfood Item No.");
                Rec."No. Series" := '';
            end;
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
        IsUsdErr: Label 'This Item is used in a Order or Posted Order and cannot be deleted';
}
