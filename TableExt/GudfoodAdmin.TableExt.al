namespace Projecttest.Projecttest;

using System.Security.User;

tableextension 50101 GudfoodAdmin extends "User Setup"
{
    fields
    {
        field(50100; IsAdmin; Boolean)
        {
            Caption = 'IsAdmin';
            DataClassification = ToBeClassified;
        }
    }
}
