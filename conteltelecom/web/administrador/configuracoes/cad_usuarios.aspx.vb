Imports Telerik.Web.UI

Public Class cad_usuarios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        PersonalizarControles.SubRadWindowManager(RadWindowManagerMsg, 0)
    End Sub

    Private Sub RadGridCadUseuarios_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridCadUseuarios.ItemCommand

        Try

            If e.CommandName = RadGrid.UpdateCommandName Then

                Dim autoCompleteBox As New RadAutoCompleteBox
                Dim username_USUARIOSTextBox As New RadTextBox
                Dim password_USUARIOSTextBox As New RadTextBox
                Dim id_USUARIOSLabelEdit As New Label
                Dim id_PS_PERMISSAO As New RadDropDownList
                Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
                id_USUARIOSLabelEdit = DirectCast(eitem.FindControl("id_USUARIOSLabelEdit"), Label)

                username_USUARIOSTextBox = DirectCast(eitem.FindControl("username_USUARIOSTextBox"), RadTextBox)
                password_USUARIOSTextBox = DirectCast(eitem.FindControl("password_USUARIOSTextBox"), RadTextBox)
                id_PS_PERMISSAO = DirectCast(eitem.FindControl("RadDropDownListdecs_PS_PERMISSAO"), RadDropDownList)
                Dim strSQL As String
                strSQL = "UPDATE USUARIOS SET
username_USUARIOS = @username_USUARIOS, 
password_USUARIOS = PWDENCRYPT(@password_USUARIOS)
, id_PS_PERMISSAO = @id_PS_PERMISSAO 
WHERE (id_USUARIOS = @id_USUARIOS)"
                Dim strConexao As New Sql
                Dim cnn As Data.SqlClient.SqlConnection
                Dim cmd As Data.SqlClient.SqlCommand
                Dim param As Data.SqlClient.SqlParameter
                'defina a string de conexão e cria uma nova conexão
                Dim connString As String = strConexao.StrConectionString()
                cnn = New Data.SqlClient.SqlConnection(connString)

                'define o comando a ser executado
                cmd = New Data.SqlClient.SqlCommand(strSQL, cnn)




                param = New Data.SqlClient.SqlParameter("@username_USUARIOS", Data.SqlDbType.VarChar) 'OK
                param.Value = username_USUARIOSTextBox.Text
                cmd.Parameters.Add(param)


                param = New Data.SqlClient.SqlParameter("@id_PS_PERMISSAO", Data.SqlDbType.Int) 'OK
                param.Value = id_PS_PERMISSAO.SelectedValue
                cmd.Parameters.Add(param)

                param = New Data.SqlClient.SqlParameter("@id_USUARIOS", Data.SqlDbType.Int) 'ok
                param.Value = id_USUARIOSLabelEdit.Text
                cmd.Parameters.Add(param)

                param = New Data.SqlClient.SqlParameter("@password_USUARIOS", Data.SqlDbType.VarChar) 'ok
                param.Value = password_USUARIOSTextBox.Text
                cmd.Parameters.Add(param)





                'abre a conexão
                cnn.Open()

                    cmd.ExecuteNonQuery()

                    '                'fecha a conexao
                    cnn.Close()



            End If
            If e.CommandName = RadGrid.PerformInsertCommandName Then
                Dim idCompany As Integer
                Dim autoCompleteBox As New RadAutoCompleteBox
                Dim username_USUARIOSTextBox As New RadTextBox
                Dim password_USUARIOSTextBox As New RadTextBox
                Dim RadDropDownListdecs_PS_PERMISSAO As New RadDropDownList
                Dim eitem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
                autoCompleteBox = DirectCast(eitem.FindControl("RadAutoCompleteBoxBuscaContato"), RadAutoCompleteBox)
                RadDropDownListdecs_PS_PERMISSAO = DirectCast(eitem.FindControl("RadDropDownListdecs_PS_PERMISSAO"), RadDropDownList)
                username_USUARIOSTextBox = DirectCast(eitem.FindControl("username_USUARIOSTextBox"), RadTextBox)
                password_USUARIOSTextBox = DirectCast(eitem.FindControl("password_USUARIOSTextBox"), RadTextBox)
                For Each entry As AutoCompleteBoxEntry In autoCompleteBox.Entries
                    If entry.Text = autoCompleteBox.Text Then
                        idCompany = Convert.ToInt32(entry.Value)
                    End If
                Next
                SqlDataSourceCriaUsuarios.InsertParameters("atendeChamado_USUARIOS").DefaultValue = 0
                SqlDataSourceCriaUsuarios.InsertParameters("id_PS_PERMISSAO").DefaultValue = RadDropDownListdecs_PS_PERMISSAO.SelectedValue
                SqlDataSourceCriaUsuarios.InsertParameters("id_PS_PESSOA").DefaultValue = idCompany
                SqlDataSourceCriaUsuarios.InsertParameters("username_USUARIOS").DefaultValue = username_USUARIOSTextBox.Text
                SqlDataSourceCriaUsuarios.InsertParameters("password_USUARIOS").DefaultValue = password_USUARIOSTextBox.Text
                SqlDataSourceCriaUsuarios.InsertParameters("idEmpresa_PS_PESSOA").DefaultValue = Request.QueryString("codMatriz_PS_CLIENTES")

            End If

            If e.CommandName = RadGrid.DeleteCommandName Then

            End If
        Catch ex As Exception
            Dim clsMesnagem As New Mensagens
            clsMesnagem.FnMesnagens(ex, RadWindowManagerMsg, 1)
            clsMesnagem = Nothing
        End Try
    End Sub

    Private Sub RadGridCadUseuarios_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGridCadUseuarios.ItemDataBound
        If TypeOf e.Item Is GridDataItem AndAlso e.Item.IsInEditMode Then
            If e.Item.OwnerTableView.Name = "Master" Then
                Dim item As GridDataItem = DirectCast(e.Item, GridDataItem)
                Dim Labeldesc_PS_PESSOA As Label = DirectCast(item.FindControl("Labeldesc_PS_PESSOA"), Label)
                Dim autoCompleteBox As RadAutoCompleteBox = DirectCast(item.FindControl("RadAutoCompleteBoxBuscaContato"), RadAutoCompleteBox)
                Dim RadButtonDetalhesFilho As RadButton = DirectCast(item.FindControl("RadButtonDetalhesFilho"), RadButton)
                If TypeOf e.Item Is GridEditFormInsertItem OrElse TypeOf e.Item Is GridDataInsertItem Then
                    Labeldesc_PS_PESSOA.Visible = False
                    autoCompleteBox.Visible = True
                    RadButtonDetalhesFilho.Enabled = False
                Else
                    Labeldesc_PS_PESSOA.Visible = True
                    autoCompleteBox.Visible = False
                    RadButtonDetalhesFilho.Enabled = True
                End If


            End If

            End If

    End Sub

    Private Sub RadGridCadUseuarios_PreRender(sender As Object, e As EventArgs) Handles RadGridCadUseuarios.PreRender
        If IsPostBack = False Then

            PersonalizarControles.SubRadGrid(RadGridCadUseuarios, 0)
            RadGridCadUseuarios.Rebind()
        End If

    End Sub

    Private Sub SqlDataSourceCriaUsuarios_Inserting(sender As Object, e As SqlDataSourceCommandEventArgs) Handles SqlDataSourceCriaUsuarios.Inserting
        Try



        Catch ex As Exception

        End Try
    End Sub
End Class