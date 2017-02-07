Imports System.Data.SqlClient
Imports System.Threading

Imports conteltelecom.Validacoes

Public Class Complemento
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click


        If fu1.HasFile Then

            fu1.SaveAs(Server.MapPath("mycsvNOvo.csv"))

            Dim records() As String = System.IO.File.ReadAllLines(Server.MapPath("mycsvNOvo.csv"), System.Text.Encoding.Default)

            For i As Integer = 0 To records.Length - 1

                Dim record() As String = records(i).Split(";")
                CreateRecord(record)

            Next
            Response.Write("Succesfully uploaded to sql")
        Else
            Response.Write("Please input a file")
        End If



    End Sub



    Private Function CreateRecord(ByVal record() As String) As Boolean
        Dim id_product As Integer
        Dim ean13 As String = record(3).ToString
        Dim quantity As String = record(2).ToString
        Dim price As String = record(1).ToString

        If ean13 <> "" Then
            Try


                SqlDataSourceUpdateQuantidade.SelectParameters("ean13").DefaultValue = ean13
                Dim dvSql As DataView = CType(SqlDataSourceUpdateQuantidade.Select(DataSourceSelectArguments.Empty), DataView)
                If dvSql IsNot Nothing Then
                    If dvSql.Count <> 0 Then
                        'id_product_estoque

                        For Each drvSql As DataRowView In dvSql
                            If IsDBNull(drvSql("id_product_estoque")) = False Then

                                id_product = If(IsDBNull(drvSql("id_product")) = True, -1, drvSql("id_product"))
                                quantity = Replace(quantity, ",", ".")
                                price = Replace(price, ",", ".")
                                SqlDataSourceUpdateQuantidade.UpdateParameters("id_product").DefaultValue = id_product
                                SqlDataSourceUpdateQuantidade.UpdateParameters("quantity").DefaultValue = quantity
                                SqlDataSourceUpdateQuantidade.Update()


                            Else
                                id_product = If(IsDBNull(drvSql("id_product")) = True, -1, drvSql("id_product"))
                                quantity = Replace(quantity, ",", ".")
                                price = Replace(price, ",", ".")
                                SqlDataSourceUpdateQuantidade.InsertParameters("id_product").DefaultValue = id_product
                                SqlDataSourceUpdateQuantidade.InsertParameters("quantity").DefaultValue = quantity
                                Try
                                    SqlDataSourceUpdateQuantidade.Insert()
                                Catch ex As Exception

                                End Try



                            End If
                            SqlDataSourcePreco.UpdateParameters("price").DefaultValue = price
                            SqlDataSourcePreco.UpdateParameters("id_product").DefaultValue = id_product
                            Thread.Sleep(1)








                        Next
                    End If


                End If
            Catch ex As Exception

            End Try



        End If

        Return True

    End Function

    Protected Sub ButtonAjustarCodBarras_Click(sender As Object, e As EventArgs) Handles ButtonAjustarCodBarras.Click
        '   SqlDataSourceAjustarCodBarras

        Dim ean13 As String
        Dim description As String
        Dim id_product As Integer

        Dim dvSql As DataView = CType(SqlDataSourceAjustarCodBarras.Select(DataSourceSelectArguments.Empty), DataView)
        If dvSql IsNot Nothing Then
            If dvSql.Count <> 0 Then
                'id_product_estoque
                ean13 = ""
                description = ""
                For Each drvSql As DataRowView In dvSql
                    If IsDBNull(drvSql("ean13")) = False Then

                        ean13 = drvSql("ean13")
                        SomenteNumeros(ean13)

                    End If
                    If IsDBNull(drvSql("description")) = False Then

                        description = drvSql("description")
                        SomenteNumeros(description)

                    End If
                    If IsDBNull(drvSql("id_product")) = False Then

                        id_product = drvSql("id_product")


                    End If
                    If (ean13 <> description) = True And IsNumeric(description) Then

                        SqlDataSourceAjustarCodBarras.UpdateParameters("id_product").DefaultValue = id_product
                        SqlDataSourceAjustarCodBarras.UpdateParameters("ean13").DefaultValue = description
                        SqlDataSourceAjustarCodBarras.UpdateParameters("description").DefaultValue = description

                        SqlDataSourceAjustarCodBarras.Update()
                    End If


                Next
            End If
        End If

    End Sub
End Class
