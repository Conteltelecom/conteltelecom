Imports Telerik.Web.UI

Public Class cl_add_linhas_planos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then


        End If
    End Sub
    Function mascaraFone(fone As Object)


        If IsNumeric(fone.ToString) = True Then
            Dim iFone As Int64 = Convert.ToInt64(fone)
            If iFone.ToString.Length > 10 Then

                Return String.Format("{0:(##\) #####\-####}", iFone)
            Else
                If iFone.ToString.Length < 9 Then
                    Return String.Format("{0:(##\) ###\-####}", iFone)
                Else
                    Return String.Format("{0:(##\) ####\-####}", iFone)
                End If


            End If
        End If
        Return fone


    End Function
    Private Sub RadGrid1_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGrid1.ItemCommand


        If e.CommandName = "Update" Then

            Dim eitem As GridEditableItem = TryCast(e.Item, GridEditableItem)



            Dim valor_CL_PLANOS_CLIENTE As RadNumericTextBox = TryCast(eitem("valor_CL_PLANOS_CLIENTE").Controls(0), RadNumericTextBox)
            Dim id_OP_PLANOS As RadComboBox = TryCast(eitem("id_OP_PLANOS").Controls(0), RadComboBox)
            Dim desc_CL_PLANOS_CLIENTE As RadTextBox = TryCast(eitem.FindControl("desc_CL_PLANOS_CLIENTETextBox"), RadTextBox)
            Dim ordem_CL_PLANOS_CLIENTE As RadNumericTextBox = TryCast(eitem("ordem_CL_PLANOS_CLIENTE").Controls(0), RadNumericTextBox)
            Dim st_CL_PLANOS_CLIENTE As CheckBox = TryCast(eitem("st_CL_PLANOS_CLIENTE").Controls(0), CheckBox)

            'ordem_CL_PLANOS_CLIENTE = item("ordem_CL_PLANOS_CLIENTE").Text
            SqlDataSourceBuscaPlanosCliente.UpdateParameters("desc_CL_PLANOS_CLIENTE").DefaultValue = desc_CL_PLANOS_CLIENTE.Text
            SqlDataSourceBuscaPlanosCliente.UpdateParameters("id_OP_PLANOS").DefaultValue = id_OP_PLANOS.SelectedValue
            SqlDataSourceBuscaPlanosCliente.UpdateParameters("valor_CL_PLANOS_CLIENTE").DefaultValue = valor_CL_PLANOS_CLIENTE.Text
            SqlDataSourceBuscaPlanosCliente.UpdateParameters("ordem_CL_PLANOS_CLIENTE").DefaultValue = ordem_CL_PLANOS_CLIENTE.Text
            SqlDataSourceBuscaPlanosCliente.UpdateParameters("st_CL_PLANOS_CLIENTE").DefaultValue = If(st_CL_PLANOS_CLIENTE.Checked = False, 0, 1)



            SqlDataSourceBuscaPlanosCliente.Update()

        End If
        If e.CommandName = "Delete" Then
            Dim item As GridDataItem = TryCast(e.Item, GridDataItem)
            Session("DeleteValor") = item("ID_CL_PLANOSxLINHAS").Text

            RadWindowManagerMsg.RadConfirm("VOCÊ CONFIRMA A EXCLUSÃO DO REGISTRO?", "confirmDeleteBackFn", 350, 150, Nothing, "CONFIRMAÇÃO DE EXCLUSÃO")
            e.Canceled = True

        ElseIf e.CommandName = "DeleteChecked" Then
            DeleteChecked()

        End If
    End Sub

    Protected Sub DeleteChecked()
        Dim ID_CL_PLANOSxLINHAS As Integer
        For Each item As GridDataItem In RadGrid1.MasterTableView.Items

            Dim childtableViewFilho As GridTableView = DirectCast(item.ChildItem.NestedTableViews(0), GridTableView)
            For Each childItemFilho As GridDataItem In childtableViewFilho.Items
                ID_CL_PLANOSxLINHAS = childItemFilho("ID_CL_PLANOSxLINHAS").Text
                ' Dim STTextBox As CheckBox = DirectCast(item("ST").Controls(0), CheckBox)


                'If STTextBox.Checked = True Then
                ID_CL_PLANOSxLINHAS = childItemFilho("ID_CL_PLANOSxLINHAS").Text

                    SqlDataSourceBuscaPlanosCliente.DeleteParameters("id_CL_PLANOSxLINHAS").DefaultValue = ID_CL_PLANOSxLINHAS
                    SqlDataSourceBuscaPlanosCliente.Delete()
                ' If STTextBox.Checked = True Then
                'loops through each materTable rows
                Dim childtableView As GridTableView = DirectCast(childItemFilho.ChildItem.NestedTableViews(0), GridTableView)
                For Each childItem As GridDataItem In childtableView.Items
                    'Dim CheckBoxFilho As CheckBox = DirectCast(item("ST").Controls(0), CheckBox)
                    'If CheckBoxFilho.Checked = True Then
                    ID_CL_PLANOSxLINHAS = childItem("ID_CL_PLANOSxLINHAS").Text
                                SqlDataSourceBuscaPlanosCliente.DeleteParameters("id_CL_PLANOSxLINHAS").DefaultValue = ID_CL_PLANOSxLINHAS
                                SqlDataSourceBuscaPlanosCliente.Delete()
                    ' End If
                Next
                '   End If
                ' End If

            Next

        Next




            Session.Remove("DeleteValor")

        RadGrid1.DataBind()
        RadGridLinhas02.DataBind()
    End Sub




    Private Sub RadGridLinhas02_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridLinhas02.ItemCommand

        If e.CommandName = "Salvar" Then
            Dim id_LI_LINHAS As Integer
            For Each item As GridDataItem In RadGridLinhas02.MasterTableView.Items
                Dim STTextBox As CheckBox = DirectCast(item("stPai").Controls(0), CheckBox)
                If STTextBox.Checked = True Then
                    SqlDataSourceLinhas02.InsertParameters("id_OP_OPERADORAS_t_LI_LINHAS").DefaultValue = If(IsNothing(Request.QueryString("id_OP_OPERADORAS")), "2", Request.QueryString("id_OP_OPERADORAS"))
                    SqlDataSourceLinhas02.InsertParameters("id_LI_LINHAS").DefaultValue = item("id_LI_LINHAS").Text
                    id_LI_LINHAS = item("id_LI_LINHAS").Text
                    SqlDataSourceLinhas02.InsertParameters("id_CL_PLANOS_CLIENTE").DefaultValue = Request.QueryString("id_CL_PLANOS_CLIENTE")
                    SqlDataSourceLinhas02.InsertParameters("idLinhasPai_LI_LINHAS").DefaultValue = item("id_LI_LINHAS").Text

                    SqlDataSourceLinhas02.Insert()
                End If

                If STTextBox.Checked = True Then
                    'loops through each materTable rows
                    Dim childtableView As GridTableView = DirectCast(item.ChildItem.NestedTableViews(0), GridTableView)
                    For Each childItem As GridDataItem In childtableView.Items

                        Dim CheckBoxFilho As CheckBox = DirectCast(childItem("stFilha").Controls(0), CheckBox)
                        If SqlDataSourceLinhas02.InsertParameters("id_OP_OPERADORAS_t_LI_LINHAS").DefaultValue = If(IsNothing(Request.QueryString("id_OP_OPERADORAS")), "2", Request.QueryString("id_OP_OPERADORAS")) Then
                            SqlDataSourceLinhas02.InsertParameters("id_LI_LINHAS").DefaultValue = childItem("id_LI_LINHAS").Text
                            SqlDataSourceLinhas02.InsertParameters("id_CL_PLANOS_CLIENTE").DefaultValue = Request.QueryString("id_CL_PLANOS_CLIENTE")
                            SqlDataSourceLinhas02.InsertParameters("idLinhasPai_LI_LINHAS").DefaultValue = id_LI_LINHAS

                            SqlDataSourceLinhas02.Insert()
                        End If
                    Next
                End If
            Next





            RadGrid1.DataBind()
            RadGridLinhas02.DataBind()
            SetFocus(RadGrid1)
            RadWindowManagerMsg.RadAlert("REGISTROS INCLUÍDOS COM SUCESSO", 350, 150, "CONFIRMAÇÃO DE EXCLUSÃO", Nothing)

        End If




    End Sub

    Private Sub RadGridLinhas02_ItemCreated(sender As Object, e As GridItemEventArgs) Handles RadGridLinhas02.ItemCreated


        If (TypeOf e.Item Is GridCommandItem) Then
            Dim commandItem As GridCommandItem = CType(e.Item, GridCommandItem)

            If (TypeOf commandItem.NamingContainer Is GridTHead) Then

                commandItem.FindControl("RadImageButtonOK").Visible = False
                commandItem.FindControl("RadImageButtonCancel").Visible = False

            ElseIf (TypeOf commandItem.NamingContainer Is GridTFoot) Then

                commandItem.FindControl("LabelLinhasDisponiveis").Visible = False

            End If
        End If
        Dim headerItem As GridHeaderItem = TryCast(e.Item, GridHeaderItem)
        If headerItem IsNot Nothing AndAlso e.Item.OwnerTableView.Name = RadGridLinhas02.MasterTableView.Name Then
            Dim checkBox As CheckBox = TryCast(headerItem("stPai").Controls(0), CheckBox)
            checkBox.Attributes("onclick") = "selectAllDetailTables(this)"
        End If
    End Sub

    Private Sub RadGridLinhas02_PreRender(sender As Object, e As EventArgs) Handles RadGridLinhas02.PreRender
        ' HideExpandColumnRecursive(RadGridLinhas02.MasterTableView)
    End Sub
    Public Sub HideExpandColumnRecursive(ByVal tableView As GridTableView)
        Dim nestedViewItems As GridItem() = tableView.GetItems(GridItemType.NestedView)
        For Each nestedViewItem As GridNestedViewItem In nestedViewItems
            For Each nestedView As GridTableView In nestedViewItem.NestedTableViews
                If nestedView.Items.Count = 0 Then
                    Dim cell As TableCell = nestedView.ParentItem("ExpandColumn")
                    cell.Controls(0).Visible = False
                    cell.Text = "&nbsp"
                    nestedViewItem.Visible = False
                End If
                If nestedView.HasDetailTables Then
                    HideExpandColumnRecursive(nestedView)
                End If
            Next
        Next
    End Sub

    Protected Sub STTextBox_TextChanged(sender As Object, e As EventArgs)

        For Each item As GridDataItem In RadGridLinhas02.MasterTableView.Items
            Dim STTextBox As CheckBox = DirectCast(item.FindControl("STTextBox"), CheckBox)

            'loops through each materTable rows
            Dim childtableView As GridTableView = DirectCast(item.ChildItem.NestedTableViews(0), GridTableView)
                For Each childItem As GridDataItem In childtableView.Items

                    Dim CheckBoxFilho As CheckBox = DirectCast(childItem.FindControl("CheckBoxFilho"), CheckBox)
                If STTextBox.Checked = True Then
                    CheckBoxFilho.Checked = True
                Else
                    CheckBoxFilho.Checked = False 
                End If
            Next



        Next




    End Sub


End Class