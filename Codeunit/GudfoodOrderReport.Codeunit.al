namespace Projecttest.Projecttest;

codeunit 50102 "Gudfood Order Report"
{
    TableNo = "Gudfood Order Header";

    trigger OnRun()
    begin
        Report(Rec);
    end;

    procedure Report(var Order: Record "Gudfood Order Header")
    var
        Report: Report "Gudfood Order Report";
    begin
        Order.SetFilter("No.", Order."No.");
        Report.SetTableView(Order);
        Report.Run();
    end;
}
