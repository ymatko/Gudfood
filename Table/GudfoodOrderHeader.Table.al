table 50101 "Gudfood Order Header"
{
    Caption = 'Gudfood Order Header';
    DataClassification = CustomerContent;
    DrillDownPageId = "Gudfood Order";
    LookupPageId = "Gudfood Order List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                TestNoSeries();
            end;
        }
        field(2; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer;
            trigger OnValidate()
            var
                Customer: Record "Customer";
            begin
                Customer.Get(Rec."Sell-to Customer No.");
                Rec."Sell-to Customer Name" := Customer.Name;
            end;
        }
        field(3; "Sell-to Customer Name"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            DataClassification = CustomerContent;
        }
        field(4; "Order Date"; Date)
        {
            Caption = 'Order Date';
            DataClassification = CustomerContent;
        }
        field(5; "Posting No."; Code[20])
        {
            Caption = 'Posting No.';
            DataClassification = CustomerContent;
        }
        field(6; "Date Created"; Date)
        {
            Caption = 'Date Created';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(7; "Total Qty"; Decimal)
        {
            Caption = 'Total Qty';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("Gudfood Order Line".Quantity where("Order No." = field("No.")));
        }
        field(8; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("Gudfood Order Line".Amount where("Order No." = field("No.")));
        }
        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(11; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
    begin
        if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Gudfood Order No.");
            if NoSeries.AreRelated(SalesSetup."Gudfood Order No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series"
            else
                "No. Series" := SalesSetup."Gudfood Order No.";
            "No." := NoSeries.GetNextNo("No. Series");
        end;
        "User ID" := UserId;
    end;

    local procedure TestNoSeries()
    var
        Order: Record "Gudfood Order Header";
    begin
        if Rec."No." <> xRec."No." then begin
            if not Order.Get(Rec."No.") then begin
                SalesSetup.Get();
                SalesSetup.TestField("Gudfood Order No.");
                Rec."No. Series" := '';
            end;
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
}