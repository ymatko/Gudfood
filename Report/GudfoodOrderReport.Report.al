report 50100 "Gudfood Order Report"
{
    Caption = 'Gudfood Order Report';
    DefaultRenderingLayout = "Gudfood Order Report";
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem("Gudfood Order Header"; "Gudfood Order Header")
        {
            column(No_; "No.")
            {
            }
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {
            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {
            }
            column(Order_Date; "Order Date")
            {
            }
            column("User_ID"; UserID)
            {
            }
            column("Document_Date"; Today)
            {
            }

            dataitem(OrderLine; "Gudfood Order Line")
            {
                DataItemLinkReference = "Gudfood Order Header";
                DataItemLink = "Order No." = field("No.");

                column(Item_No_; "Gudfood Item No.")
                {
                }
                column(Item_Type; "Item Type")
                {
                }
                column(Description; Description)
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(Unit_Price; "Unit Price")
                {
                }
                column(Amount; Amount)
                {
                }
                trigger OnAfterGetRecord()
                begin
                    TotalAmount += Amount;
                end;

            }
            column(Total_Amount; "Total Amount")
            {
            }
            trigger OnPreDataItem()
            begin
                TotalAmount := 0;

                if "No." <> '' then
                    SetRange("No.", "Gudfood Order Header"."No.");
            end;

        }
    }
    rendering
    {
        layout("Gudfood Order Report")
        {
            Type = RDLC;
            LayoutFile = './Report/GudfoodOrderReport.rdlc';
            Caption = 'Gudfood Order Report';
        }
        layout("Gudfood Order Report WORD")
        {
            Type = Word;
            LayoutFile = './Report/GudfoodOrderReport.docx';
            Caption = 'Gudfood Order Report';
        }
    }
    var
        TotalAmount: Decimal;
}

