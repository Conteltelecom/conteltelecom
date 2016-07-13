Imports System.Data.SqlClient

Public Class download_page
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim CslSqlConetion As New Sql

        Dim bytes As Byte()
        Dim fileName As String, contentType As String
        Dim constr As String = CslSqlConetion.StrConectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand()
                cmd.CommandText = " Select nome_ANEXOS,data_ANEXOS,mine_ANEXOS From ANEXOS Where id_ANEXOS=@Id"
                cmd.Parameters.AddWithValue("@Id", Request.QueryString("id"))
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    sdr.Read()
                    bytes = DirectCast(sdr("data_ANEXOS"), Byte())
                    contentType = sdr("mine_ANEXOS").ToString()
                    fileName = sdr("nome_ANEXOS").ToString()
                End Using
                con.Close()
            End Using
        End Using
        'Response.Clear()
        Response.Buffer = True
        Response.Charset = ""
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.ContentType = contentType
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName)
        Response.BinaryWrite(bytes)
        Response.Flush()
        Response.End()
    End Sub

End Class