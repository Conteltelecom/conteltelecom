Imports Telerik.Web.UI

Public Class Controles
    Public Sub Limpar(ByVal controlP As Control)

        Dim ctl As Control

        For Each ctl In controlP.Controls
            If TypeOf ctl Is TextBox Then

                DirectCast(ctl, TextBox).Text = String.Empty

            ElseIf ctl.Controls.Count > 0 Then

                Limpar(ctl)

            End If

        Next

    End Sub

    Public Function ProperCase(ByVal str As String) As String
        Try
            str = LTrim(str)
            ' Separa o nome convertido(através do StrConv) para uma variável
            Dim strSplit() As String = StrConv((str), VbStrConv.ProperCase).Split(" "c)
            Dim result As String = String.Empty

            ' Faz um ciclo em todas as palavras encontradas
            For x As Byte = 0 To strSplit.Length - 1

                ' Caso a dimenção seja igual ou inferior a 3 converte
                ' para minúsculas. Caso contrário apenas contrói o resultado
                If strSplit(x).Length < 3 Then
                    result &= strSplit(x).ToLower + Space(1)
                Else
                    result &= strSplit(x) + Space(1)
                End If
            Next

            ' Retorna o nome convertido
            Return result

        Catch ex As Exception
            ' Em caso de erro retorna o texto em branco
            Return String.Empty
        End Try

    End Function

    Sub GridCommandItem(ByRef ComandButon1 As RadButton, ByRef ComandButon2 As RadButton, ByVal strmodo As String)
        ComandButon1.Width = 130
        ComandButon2.Width = 130
        Select Case strmodo
            Case "Edit"
                ComandButon1.Text = "SALVAR"
                ComandButon1.ToolTip = "SALVAR"
                ComandButon1.CommandName = "Update"

                ComandButon2.Text = "CANCELAR"
                ComandButon2.CommandName = "CANCELAR"
                ComandButon2.ToolTip = "CANCELAR"
                ComandButon1.Icon.PrimaryIconUrl = "~/img/accept.png"
                ComandButon2.Icon.PrimaryIconUrl = "~/img/block.png"

                Exit Select

            Case "InitInsert"
                ComandButon1.Text = "SALVAR"
                ComandButon1.ToolTip = "SALVAR"
                ComandButon1.CommandName = "PerformInsert"
                ComandButon2.Text = "CANCELAR"
                ComandButon2.CommandName = "CANCELAR"
                ComandButon2.ToolTip = "CANCELAR"
                ComandButon1.Icon.PrimaryIconUrl = "~/img/accept.png"
                ComandButon2.Icon.PrimaryIconUrl = "~/img/block.png"

                ComandButon2.CommandName = "CANCELAR"
                Exit Select
            Case "Detalhes"

                ComandButon1.Text = "EDITAR"
                ComandButon1.Visible = False
                ComandButon1.ToolTip = "EDITAR"
                ComandButon1.CommandName = "Edit"
                ComandButon2.Text = "CANCELAR"
                ComandButon2.CommandName = "CANCELAR"
                ComandButon2.ToolTip = "CANCELAR"
                ComandButon1.Icon.PrimaryIconUrl = "~/img/Editar.png"
                ComandButon2.Icon.PrimaryIconUrl = "~/img/block.png"



        End Select



    End Sub

End Class
