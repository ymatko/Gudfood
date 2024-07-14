page 50104 "Gudfood Order"
{
    ApplicationArea = All;
    Caption = 'Gudfood Order';
    PageType = Document;
    SourceTable = "Gudfood Order Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                }
                field("Order Date"; Rec."Order Date")
                {
                }
                field("Date Created"; Rec."Date Created")
                {
                }
                field("Total Qty"; Rec."Total Qty")
                {
                }
                field("Total Amount"; Rec."Total Amount")
                {
                }

            }
            part(GudfoodOrderLines; "Gudfood Order Subpage")
            {
                SubPageLink = "Order No." = field("No.");
                UpdatePropagation = Both;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Print)
            {
                Caption = 'Print';
                Image = Print;
                ToolTip = 'Print the selected order report';
                ApplicationArea = All;
                RunObject = codeunit "Gudfood Order Report";
            }
            action(ExportOrder)
            {
                Caption = 'Export Order';
                Image = XMLFile;
                ApplicationArea = All;
                ToolTip = 'Export the selected order to XML';
                RunObject = codeunit "Gudfood Order ExportXML";
            }
        }
        area(Promoted)
        {
            actionref(PrintActionRef; Print)
            {
            }
            actionref(ExportToXmlActionRef; ExportOrder)
            {
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Date Created" := Today;
        Rec."Order Date" := Today;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        Rec.CalcFields("Total Amount", "Total Qty")
    end;
}
