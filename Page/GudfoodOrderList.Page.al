page 50105 "Gudfood Order List"
{
    ApplicationArea = All;
    Caption = 'Gudfood Order List';
    PageType = List;
    SourceTable = "Gudfood Order Header";
    UsageCategory = Lists;
    CardPageId = "Gudfood Order";
    RefreshOnActivate = true;

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
                field("Date Created"; Rec."Date Created")
                {
                    ToolTip = 'Specifies that the Date Created';
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
    actions
    {
        area(Processing)
        {
            action(Post)
            {
                Caption = 'Post';
                Image = Post;
                ToolTip = 'Post the selected order';
                ApplicationArea = All;
                RunObject = codeunit "Gudfood Order Post";
            }
            action(ExportOrder)
            {
                Caption = 'Export Order';
                Image = XMLFile;
                ToolTip = 'Export the selected all orders to XML';
                ApplicationArea = All;
                trigger OnAction()
                var
                    SelectedOrders: Record "Gudfood Order Header";
                    Xml: Codeunit "Gudfood Order ExportXML";
                begin
                    CurrPage.SetSelectionFilter(SelectedOrders);
                    Xml.ExportToXml(SelectedOrders);
                end;
            }
        }
        area(Promoted)
        {
            actionref(PostActionRef; Post)
            {
            }
            actionref(ExportToXmlActionRef; ExportOrder)
            {
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
