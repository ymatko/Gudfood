pageextension 50100 "Sales & Receivables Page Ext" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast(content)
        {
            group("Gudfood")
            {
                Caption = 'Gudfood';
                field("Gudfood No."; Rec."Gudfood Item No.")
                {
                    Caption = 'Gudfood Item No.';
                    ToolTip = 'Series of numbers for Gudfood Item';
                    ApplicationArea = All;
                }
                field("Gudfoof Order No."; Rec."Gudfood Order No.")
                {
                    Caption = 'Gudfoof Order No.';
                    ToolTip = 'Series of numbers for Gudfoof Order';
                    ApplicationArea = All;
                }
                field("Posted Gudfoof Order No."; Rec."Posted Gudfood Order No.")
                {
                    Caption = 'Posted Gudfoof Order No.';
                    ToolTip = 'Series of numbers for Posted Gudfoof Order';
                    ApplicationArea = All;
                }
            }
        }
    }
}

