namespace Projecttest.Projecttest;
using System.Utilities;

codeunit 50103 "Gudfood Order ExportXML"
{
    TableNo = "Gudfood Order Header";

    trigger OnRun()
    begin
        ExportToXml(Rec);
    end;

    procedure ExportToXml(var SelectedOrders: Record "Gudfood Order Header")
    var
        TempBlob: Codeunit "Temp Blob";
        OrderXml: XmlPort "Export Gudfood Order";
        OutStr: OutStream;
        InStr: InStream;
        FileName: Text;
    begin
        TempBlob.CreateOutStream(OutStr);

        OrderXml.SetTableView(SelectedOrders);
        OrderXml.SetDestination(OutStr);
        OrderXml.Export();

        TempBlob.CreateInStream(InStr);
        FileName := 'Selected GudfoodOrders.xml';
        File.DownloadFromStream(InStr, 'Download', '', '', FileName);
    end;
}
