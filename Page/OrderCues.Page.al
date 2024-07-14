namespace GudFood.GudFood;
using System.Security.User;

page 50113 "Order Cues"
{
    ApplicationArea = All;
    Caption = 'Order Cues';
    PageType = CardPart;

    layout
    {
        area(Content)
        {
            cuegroup(Group1)
            {
                Caption = 'Orders';
                CuegroupLayout = Wide;
                field(Order; OrderCount)
                {
                    Caption = 'Orders';
                    ToolTip = 'Orders';
                    ApplicationArea = All;
                    DrillDownPageId = "Gudfood Order List";
                    Editable = false;
                    DrillDown = true;

                }
                field(POstedOrder; PostedOrderCount)
                {
                    Caption = 'Posted Orders';
                    ToolTip = 'Posted Orders';
                    ApplicationArea = All;

                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        OrderCount := GetCountOfOrders();
        PostedOrderCount := GetCountOfPostedOrders();
    end;

    local procedure GetCountOfOrders(): Integer
    var
        Orders: Record "Gudfood Order Header";
        UserSetup: Record "User Setup";
    begin
        Orders.FilterGroup(1);
        if UserSetup.Get(UserId) then begin
            if not UserSetup.IsAdmin then
                Orders.SetFilter("User ID", UserId);
        end else
            Orders.SetFilter("User ID", UserId);
        Orders.FilterGroup(0);
        exit(Orders.Count)
    end;

    local procedure GetCountOfPostedOrders(): Integer
    var
        Orders: Record "Posted Gudfood Order Header";
        UserSetup: Record "User Setup";
    begin
        Orders.FilterGroup(1);
        if UserSetup.Get(UserId) then begin
            if not UserSetup.IsAdmin then
                Orders.SetFilter("User ID", UserId);
        end else
            Orders.SetFilter("User ID", UserId);
        Orders.FilterGroup(0);
        exit(Orders.Count)
    end;

    var
        OrderCount: Integer;
        PostedOrderCount: Integer;
}
