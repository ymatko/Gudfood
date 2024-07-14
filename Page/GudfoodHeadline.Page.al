namespace System.Visualization;

page 50112 "Gudfood Headline"
{
    Caption = 'Headline';
    PageType = HeadlinePart;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            group(Control1)
            {
                ShowCaption = false;
                Visible = UserGreetingVisible;
                field(GreetingText; RCHeadlinesPageCommon.GetGreetingText())
                {
                    ApplicationArea = All;
                    Caption = 'Greeting headline';
                    Editable = false;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        RCHeadlinesPageCommon.HeadlineOnOpenPage(Page::"Headline RC Business Manager");
        DefaultFieldsVisible := RCHeadlinesPageCommon.AreDefaultFieldsVisible();
        UserGreetingVisible := RCHeadlinesPageCommon.IsUserGreetingVisible();
    end;

    var
        RCHeadlinesPageCommon: Codeunit "RC Headlines Page Common";

        DefaultFieldsVisible: Boolean;
        UserGreetingVisible: Boolean;
}

