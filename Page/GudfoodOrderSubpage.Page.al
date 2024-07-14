page 50103 "Gudfood Order Subpage"
{
    ApplicationArea = All;
    Caption = 'Gudfood Order Subpage';
    PageType = ListPart;
    SourceTable = "Gudfood Order Line";
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Line No."; Rec."Line No.")
                {
                }
                field("Item No."; Rec."Gudfood Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Quantity; Rec.Quantity)
                {
                    trigger OnValidate()
                    begin
                        if Rec.Quantity < 0 then
                            Error(CannotBeLess0);
                    end;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Line No." := GetNextLineNo();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if Rec."Gudfood Item No." = '' then
            Error(FieldReqErr);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        CurrPage.Update(false);
    end;


    local procedure GetNextLineNo(): Integer
    var
        GudfoodOrderLine: Record "Gudfood Order Line";
    begin
        GudfoodOrderLine.Reset();
        GudfoodOrderLine.SetRange("Order No.", Rec."Order No.");
        if GudfoodOrderLine.FindLast() then
            exit(GudfoodOrderLine."Line No." + 10000)
        else
            exit(10000);
    end;

    var
        FieldReqErr: Label 'The previous line does not have an item number.';
        CannotBeLess0: Label 'The value cannot be less than 0';
}
