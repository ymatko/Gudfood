namespace Projecttest.Projecttest;

using System.Security.User;

pageextension 50101 GudfoodAdmin extends "User Setup"
{
    layout
    {
        addlast(Control1)
        {
            field(IsAdmin; Rec.IsAdmin)
            {
                ToolTip = 'This user is an admin';
                ApplicationArea = All;
            }

        }
    }
}
