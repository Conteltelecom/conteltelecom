﻿Public Class Site_Mobile
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim ValidaSessao As New VarSession
        If ValidaSessao.ValidaSessao() = False Then
            HttpContext.Current.Response.Redirect("~/logoff.aspx")
        End If
    End Sub

End Class