page 50106 "Posted Gudfood Order List"
{
    ApplicationArea = All;
    Caption = 'Posted Gudfood Order List';
    PageType = List;
    SourceTable = "Posted Gudfood Order Header";
    UsageCategory = Lists;
    CardPageId = "Posted Gudfood Order";
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies that the No.';
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specifies that the Sell-to Customer No.';
                    ApplicationArea = All;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ToolTip = 'Specifies that the Sell-to Customer Name';
                    ApplicationArea = All;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ToolTip = 'Specifies that the Order Date';
                    ApplicationArea = All;
                }
                field("Posting No."; Rec."Posting No.")
                {
                    ToolTip = 'Specifies that the Posting No.';
                    ApplicationArea = All;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ToolTip = 'Specifies that the Date Created';
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies that the Date Posted';
                    ApplicationArea = All;
                }
                field("Total Qty"; Rec."Total Qty")
                {
                    ToolTip = 'Specifies that the Total Qty';
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies that the Total Amount';
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        Rec.FilterGroup(1);
        if UserSetup.Get(UserId) then begin
            if not UserSetup.IsAdmin then
                Rec.SetFilter("User ID", UserId);
        end else
            Rec.SetFilter("User ID", UserId);
        Rec.FilterGroup(0);
    end;
}
