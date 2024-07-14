page 50107 "Posted Gudfood Order Subpage"
{
    ApplicationArea = All;
    Caption = 'Posted Gudfood Order Subpage';
    PageType = ListPart;
    SourceTable = "Posted Gudfood Order Line";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Order No."; Rec."Order No.")
                {
                }
                field("Line No."; Rec."Line No.")
                {
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                }
                field("Date Created"; Rec."Date Created")
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
}
