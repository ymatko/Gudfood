page 50101 "Gudfood Item Card"
{
    ApplicationArea = All;
    Caption = 'Gudfood Item Card';
    PageType = Card;
    SourceTable = "Gudfood Item";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; Rec.Code)
                {
                    ToolTip = 'Specifies that the Code';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies that the Description';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies that the Unit Price';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies that the Type';
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies that the Picture';
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies that the Shelf Life';
                    NotBlank = true;
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        if Rec."Shelf Life" < Today then
                            Error(CannotBeLessErr);
                    end;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies that the Item';
                    NotBlank = true;
                    ShowMandatory = true;
                }
            }
            group(Order)
            {
                Caption = 'Order';
                field("Qty. Ordered"; Rec."Qty. Ordered")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies that the Qty. Ordered';
                }
                field("Qty. in Order"; Rec."Qty. in Order")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies that the Qty. in Order';
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
    actions
    {
        area(Processing)
        {
            action(ImportItemPicture)
            {
                Caption = 'Import Item Picture';
                ApplicationArea = All;
                Image = Import;
                ToolTip = 'Import Item Picture';
                RunObject = codeunit ImportImage;
            }
        }
        area(Promoted)
        {
            actionref(ImportItemPictureActionRef; ImportItemPicture)
            {
            }
        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if Rec."Unit Price" = 0 then
            Error(FieldReqErr, Rec.FieldCaption("Unit Price"));
        if Rec."Item No." = '' then
            Error(FieldReqErr, Rec.FieldCaption("Item No."));
        if Rec."Shelf Life" = 0D then
            Error(FieldReqErr, Rec.FieldCaption("Shelf Life"));
    end;

    var
        FieldReqErr: Label '%1 field is required';
        CannotBeLessErr: Label 'The Shelf Life field cannot be less than today''s date.';
}
