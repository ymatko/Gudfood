page 50108 "Posted Gudfood Order"
{
    ApplicationArea = All;
    Caption = 'Posted Gudfood Order';
    PageType = Document;
    SourceTable = "Posted Gudfood Order Header";
    Editable = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                }
                field("Order Date"; Rec."Order Date")
                {
                }
                field("Posting No."; Rec."Posting No.")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Date Created"; Rec."Date Created")
                {
                }
                field("Total Qty"; Rec."Total Qty")
                {
                }
                field("Total Amount"; Rec."Total Amount")
                {
                }

            }
            part(PostedGudfoodOrderLines; "Posted Gudfood Order Subpage")
            {
                SubPageLink = "Order No." = field("No.");
                UpdatePropagation = Both;
            }
        }
    }
}
