page 50109 "Gudfood Role Center"
{
    PageType = RoleCenter;
    Caption = 'My Role Center';

    layout
    {
        area(RoleCenter)
        {
            part(Control139; "Gudfood Headline")
            {
                ApplicationArea = All;
            }
            part(Order; "Order Cues")
            {
                Caption = 'All Orders';
                ApplicationArea = All;
            }
            group(Group)
            {
                part(Control1; "Gudfood Order ListPart")
                {
                    ApplicationArea = All;

                }
                part(Control2; "Gudfood Item PartList")
                {
                    ApplicationArea = All;
                }
            }
        }
    }


    actions
    {
        area(Embedding)
        {

            action(Orders)
            {
                Caption = 'Orders list';
                RunObject = Page "Gudfood Order List";
                ApplicationArea = All;
            }

            action(PostedOrders)
            {
                Caption = 'Posted Orders list';
                RunObject = Page "Posted Gudfood Order List";
                ApplicationArea = All;

            }
            action(Item)
            {
                Caption = 'Items list';
                RunObject = Page "Gudfood Item List";
                ApplicationArea = All;

            }
        }
        area(Creation)
        {
            action(CreateOrder)
            {
                ApplicationArea = All;
                Caption = 'Create Order';
                Image = NewDocument;
                RunObject = Page "Gudfood Order";
                RunPageMode = Create;
            }
            action(CreateMeal)
            {
                ApplicationArea = All;
                Caption = 'Create Item';
                Image = NewDocument;
                RunObject = Page "Gudfood Item Card";
                RunPageMode = Create;
            }
        }
        area(Processing)
        {
            action(ExportXML)
            {
                ApplicationArea = All;
                Caption = 'Export XML';
                Image = CreateXMLFile;
                RunObject = xmlport "Export Gudfood Order";
                RunPageMode = Create;
            }
            action(CreateReport)
            {
                ApplicationArea = All;
                Caption = 'Create Report';
                Image = Create;
                RunObject = report "Gudfood Order Report";
                RunPageMode = Create;
            }
        }
    }
}

profile MyProfile
{
    ProfileDescription = 'Order Management';
    RoleCenter = "Gudfood Role Center";
    Caption = 'Order Management';
}

