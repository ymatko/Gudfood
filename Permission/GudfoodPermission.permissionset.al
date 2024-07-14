permissionset 50100 GudfoodPermission
{
    Assignable = true;
    Permissions = tabledata "Gudfood Item" = RIMD,
        tabledata "Gudfood Order Header" = RIMD,
        tabledata "Gudfood Order Line" = RIMD,
        tabledata "Posted Gudfood Order Header" = RIMD,
        tabledata "Posted Gudfood Order Line" = RIMD;
}