page 50111 "Gudfood Order ListPart"
{
    ApplicationArea = All;
    Caption = 'All Gudfood Orders';
    PageType = ListPart;
    SourceTable = "Gudfood Order Header";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;
                }
                field("Total Qty"; Rec."Total Qty")
                {
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
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
            if not UserSetup.IsAdmin then begin
                if UserId <> 'ADMIN' then
                    Rec.SetFilter("User ID", UserId);
            end;
        end else
            Rec.SetFilter("User ID", UserId);
        Rec.FilterGroup(0);
    end;
}
