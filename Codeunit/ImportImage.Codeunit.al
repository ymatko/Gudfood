namespace Projecttest.Projecttest;
using Microsoft.Inventory.Item;

codeunit 50101 ImportImage
{
    TableNo = "Gudfood Item";
    trigger OnRun()
    begin
        ImportImage(Rec);
    end;

    procedure ImportImage(var Item: Record "Gudfood Item")
    var
        PicInStream: InStream;
        FromFileName: Text;
        OverrideImageQst: Label 'The existing picture will be replaced. Continue?';
    begin
        if Item.Picture.HasValue() then
            if not Confirm(OverrideImageQst) then
                exit;

        if File.UploadIntoStream('Import', '', 'JPEG Image (*.jpeg)|*.jpeg|Bitmap Image (*.bmp)|*.bmp', FromFileName, PicInStream) then begin
            Item.Picture.ImportStream(PicInStream, FromFileName);
            Item.Modify();
        end;
    end;
}
