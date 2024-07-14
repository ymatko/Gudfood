page 50102 "Gudfood Item Image"
{
    PageType = CardPart;
    SourceTable = "Gudfood Item";
    ApplicationArea = All;
    Caption = 'Gudfood Item Image';

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Picture"; Rec."Picture")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
            }
        }
    }
}
