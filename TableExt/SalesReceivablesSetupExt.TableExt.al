tableextension 50100 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Gudfood Item No."; Code[20])
        {
            Caption = 'Gudfood Item No.';
            TableRelation = "No. Series";
        }
        field(50101; "Gudfood Order No."; Code[20])
        {
            Caption = 'Gudfoof Order No.';
            TableRelation = "No. Series";
        }
        field(50102; "Posted Gudfood Order No."; Code[20])
        {
            Caption = 'Posted Gudfoof Order No.';
            TableRelation = "No. Series";
        }
    }
}
