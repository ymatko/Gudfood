xmlport 50100 "Export Gudfood Order"
{
    Caption = 'Export Gudfood Order';
    Direction = Export;
    Format = Xml;
    UseDefaultNamespace = false;

    schema
    {

        textelement(Orders)
        {
            XmlName = 'Orders';
            tableelement(OrderHeader; "Gudfood Order Header")
            {
                XmlName = 'Order';
                fieldattribute("Date_Created"; OrderHeader."Date Created")
                {
                }
                fieldattribute(No_; OrderHeader."No.")
                {
                }
                fieldattribute(Sell_to_Customer_Id; OrderHeader."Sell-to Customer No.")
                {
                }
                fieldattribute(Sell_to_Customer_Name; OrderHeader."Sell-to Customer Name")
                {
                }
                fieldattribute(TotalAmount; OrderHeader."Total Amount")
                {
                }
                tableelement(OrderLine; "Gudfood Order Line")
                {
                    XmlName = 'OrderLine';
                    LinkTable = OrderHeader;
                    LinkFields = "Order No." = field("No.");
                    fieldattribute(Item_No_; OrderLine."Gudfood Item No.")
                    {
                    }
                    fieldattribute(Item_Type; OrderLine."Item Type")
                    {
                    }
                    fieldattribute(Description; OrderLine.Description)
                    {
                    }
                    fieldattribute(Quantity; OrderLine.Quantity)
                    {
                    }
                    fieldattribute(Unit_Price; OrderLine."Unit Price")
                    {
                    }
                    fieldattribute(Amount; OrderLine.Amount)
                    {
                    }
                }
            }

        }
    }
}
