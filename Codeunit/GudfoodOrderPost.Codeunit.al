codeunit 50100 "Gudfood Order Post"
{
    TableNo = "Gudfood Order Header";
    trigger OnRun()
    begin
        HandleOrderDeletion(Rec);
    end;

    procedure HandleOrderDeletion(var Order: Record "Gudfood Order Header")
    var
        PostedGudfoodOrderHeader: Record "Posted Gudfood Order Header";
        GudfoodOrderLine: Record "Gudfood Order Line";
        PostedGudfoodOrderLine: Record "Posted Gudfood Order Line";
        GudfoodItem: Record "Gudfood Item";
        PstSucc: Label 'Order %1 posted successfully';
    begin
        PostedGudfoodOrderHeader.Init();
        PostedGudfoodOrderHeader.TransferFields(Order);
        PostedGudfoodOrderHeader."Posting Date" := Today();
        PostedGudfoodOrderHeader."No. Series" := '';
        PostedGudfoodOrderHeader.Insert(true);

        GudfoodOrderLine.SetRange("Order No.", Order."No.");
        if GudfoodOrderLine.FindSet() then
            repeat
                PostedGudfoodOrderLine.Init();
                PostedGudfoodOrderLine.TransferFields(GudfoodOrderLine);
                PostedGudfoodOrderLine.Insert(true);
            until GudfoodOrderLine.Next() = 0;
        GudfoodOrderLine.DeleteAll(true);
        Order.Delete(true);
        Message(PstSucc, Order."No.");
    end;
}
