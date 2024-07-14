page 50100 "Gudfood Item List"
{
    ApplicationArea = All;
    Caption = 'Gudfood Item List';
    PageType = List;
    SourceTable = "Gudfood Item";
    UsageCategory = Lists;
    CardPageId = "Gudfood Item Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    ApplicationArea = All;
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            part("GudfoodItemImageFactBox"; "Gudfood Item Image")
            {
                ApplicationArea = All;
                SubPageLink = Code = field(Code);
            }
        }
    }
}
