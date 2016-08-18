Imports Telerik.Web.UI
Imports conteltelecom.Validacoes

Public Class cl_linhas_detalhes
    Inherits System.Web.UI.Page
    Dim tipo_RadNavigation As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



    End Sub

    Private Sub RadGridLinhas_ItemCreated(sender As Object, e As GridItemEventArgs) Handles RadGridLinhas.ItemCreated
        '  If Page.IsPostBack = False Then
        ' If (TypeOf e.Item Is GridCommandItem) Then
        'Dim commandItem As GridCommandItem = CType(e.Item, GridCommandItem)
        'Dim BtnSalvar_Editar As RadButton = commandItem.FindControl("BtnSalvar_Editar")
        'If Request.QueryString("modo") = "Detalhes" Then
        'BtnSalvar_Editar.Visible = False
        'End If

        'End If
        'End If
        '        Dim BtnCancelar As RadButton = commandItem.FindControl("BtnCancelar")
        '        Dim ClsControles As New Controles
        '        'If (TypeOf commandItem.NamingContainer Is GridTHead) Then
        '        'commandItem.FindControl("BtnSalvar_Editar").Visible = False
        '        ' commandItem.FindControl("BtnCancelar").Visible = False
        '        Call ClsControles.GridCommandItem(BtnSalvar_Editar, BtnCancelar, Request.QueryString("modo"))
        '        '  ElseIf (TypeOf commandItem.NamingContainer Is GridTFoot) Then

        '        'commandItem.FindControl("btnAdd").Visible = False
        '        'commandItem.FindControl("btnRefresh").Visible = False
        '        ' End If
        '    End If

        'End If

    End Sub




    Private Sub RadGridLinhas_PreRender(sender As Object, e As EventArgs) Handles RadGridLinhas.PreRender

        If Page.IsPostBack = False Then

            Select Case Request.QueryString("modo")
                Case "Edit", "PerformInsert"

                    For Each item As GridDataItem In RadGridLinhas.Items
                        If item.IsInEditMode = False Then
                            item.FireCommandEvent("EditAll", [String].Empty)
                        End If
                    Next
                    Dim codLinha_LI_LINHASTextBox As New RadTextBox
                    Dim codLinha_LI_LINHASLabel1 As New Label
                    Dim id_OP_OPERADORASRadComboBox As New RadComboBox

                    For Each item As GridDataItem In RadGridLinhas.Items

                        Select Case item.OwnerTableView.Name
                            Case "Master"
                                codLinha_LI_LINHASTextBox = DirectCast(item.FindControl("codLinha_LI_LINHASTextBox"), RadTextBox)
                                codLinha_LI_LINHASLabel1 = DirectCast(item.FindControl("codLinha_LI_LINHASLabel1"), Label)
                                id_OP_OPERADORASRadComboBox = DirectCast(item.FindControl("id_OP_OPERADORASRadComboBox"), RadComboBox)

                                If Request.QueryString("modo") = "InitInsert" Then
                                    codLinha_LI_LINHASTextBox.Visible = True
                                    codLinha_LI_LINHASLabel1.Visible = False
                                    '  id_OP_OPERADORASRadComboBox.Enabled = True
                                Else
                                    codLinha_LI_LINHASTextBox.Visible = False
                                    codLinha_LI_LINHASLabel1.Visible = True
                                    '  id_OP_OPERADORASRadComboBox.Enabled = False
                                End If

                                Exit Select
                        End Select
                    Next
                    Exit Select

                Case "Detalhes"

            End Select


        End If




    End Sub

    Protected Sub RadDropDownListUf_SelectedIndexChanged1(sender As Object, e As DropDownListEventArgs)
        SqlDataSourceDropGrid.SelectParameters("cod_PS_UF").DefaultValue = e.Value
        Dim combo As RadDropDownList = DirectCast(sender, RadDropDownList)
        Dim item As GridDataItem = DirectCast(combo.NamingContainer, GridDataItem)
        Dim RadDropDownListid_PS_CIDADES As RadDropDownList = DirectCast(item.FindControl("RadDropDownListCidades"), RadDropDownList)
        RadDropDownListid_PS_CIDADES.Items.Clear()
        RadDropDownListid_PS_CIDADES.DataBind()
    End Sub


    Private Sub RadGridLinhas_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGridLinhas.ItemDataBound




        If TypeOf e.Item Is GridEditableItem And e.Item.IsInEditMode Then

            If TypeOf e.Item Is GridEditFormInsertItem OrElse TypeOf e.Item Is GridDataInsertItem Then
                ' insert item
            Else
                Dim ditem As GridDataItem = DirectCast(e.Item, GridDataItem)
                If TypeOf e.Item Is GridDataItem AndAlso e.Item.OwnerTableView.Name = "DetailVlLinha" Then
                    Dim id_LI_TIPOSRadComboBox As RadComboBox = DirectCast(ditem.FindControl("id_LI_TIPOSRadComboBox"), RadComboBox)
                    Dim HyperLinkNovoRamal As HyperLink = DirectCast(ditem.FindControl("HyperLinkNovoRamal"), HyperLink)
                    If id_LI_TIPOSRadComboBox IsNot Nothing Then
                        If id_LI_TIPOSRadComboBox.SelectedItem.Text = "DDR" Then
                            id_LI_TIPOSRadComboBox.Width = Unit.Percentage(80)
                            HyperLinkNovoRamal.Visible = True
                        Else
                            id_LI_TIPOSRadComboBox.Width = Unit.Percentage(100)
                            HyperLinkNovoRamal.Visible = False
                        End If
                    End If
                End If
                If TypeOf e.Item Is GridDataItem AndAlso e.Item.OwnerTableView.Name = "DetailTableUFcidade" Then

                    Dim RadDropDownListUf As RadDropDownList = DirectCast(ditem.FindControl("RadDropDownListUf"), RadDropDownList)
                        SqlDataSourceDropGrid.SelectParameters("cod_PS_UF").DefaultValue = RadDropDownListUf.SelectedValue
                        Dim RadDropDownListid_PS_CIDADES As RadDropDownList = DirectCast(ditem.FindControl("RadDropDownListCidades"), RadDropDownList)
                        RadDropDownListid_PS_CIDADES.DataBind()
                        Dim LabelDropCidades As Label = DirectCast(ditem.FindControl("LabelDropCidades"), Label)
                        '   Dim LabelDropCidadesNomes As Label = DirectCast(ditem.FindControl("LabelDropCidadesNomes"), Label)

                        If Not [String].IsNullOrEmpty(LabelDropCidades.Text) Then
                            RadDropDownListid_PS_CIDADES.SelectedValue = LabelDropCidades.Text
                        End If


                    End If
                End If



        End If


    End Sub


    Sub VoltarPaginaAnterior()
        If Request.QueryString("consultaMatriz") = 2 Or Request.QueryString("consultaMatriz") Then



            If IsNothing(Request.QueryString("codMatriz_PS_CLIENTES")) = False Then

                If Request.QueryString("codMatriz_PS_CLIENTES") = "" Then
                    HttpContext.Current.Response.Redirect("~/web/clientes/cl_linhas.aspx?id_pessoas=" & Session("id_pessoaNav") & "&consultaMatriz=0")
                Else
                    HttpContext.Current.Response.Redirect("~/web/clientes/cl_linhas.aspx?id_pessoas=" & Session("id_pessoaNav") & "&consultaMatriz=1" & "&codMatriz_PS_CLIENTES=" & Request.QueryString("codMatriz_PS_CLIENTES"))
                End If

            Else
                HttpContext.Current.Response.Redirect("~/web/clientes/cl_linhas.aspx?id_pessoas=" & Session("id_pessoaNav") & "&consultaMatriz=2" & "&codMatriz_PS_CLIENTES=" & Request.QueryString("codMatriz_PS_CLIENTES"))
            End If


        Else
            HttpContext.Current.Response.Redirect("~/web/clientes/cl_linhas.aspx?id_pessoas=" & Session("id_pessoaNav"))
        End If

    End Sub



    Private Sub RadGridLinhas_ItemUpdated(sender As Object, e As GridUpdatedEventArgs) Handles RadGridLinhas.ItemUpdated
        Call VoltarPaginaAnterior()

    End Sub

    Private Sub RadGridLinhas_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridLinhas.ItemCommand

        Dim numContrato_LI_LINHASTextBox As New RadTextBox
        Dim st_LI_LINHAS As New CheckBox
        Dim id_OP_OPERADORASRadComboBox As New RadComboBox
        Dim codLinha_LI_LINHASTextBox As New RadTextBox
        '****************DetailVlLinha *********************************************
        Dim numLinha_LI_LINHAS As New RadMaskedTextBox
        Dim GridDropDownColumnid_LI_TIPOS As New RadComboBox
        Dim vlIdeal_LI_LINHAS As New RadNumericTextBox
        Dim vlInicial_id_LI_TIPOS As New RadNumericTextBox

        '***************** DetailTableDta**********************
        Dim diaVenc_LI_LINHASTextBox As New RadNumericTextBox
        Dim perIncial_LI_LINHASTextBox As New RadMaskedTextBox
        Dim numF_LI_LINHASTextBox As New RadTextBox
        Dim nomeUnidade_LI_LINHASTextBox As New RadDropDownList


        '*********************ForaAnalise*************************************
        Dim foraAnalise_LI_LINHAS As New CheckBox

        Dim liCancelada_LI_LINHAS As New CheckBox
        '*********************DetailTableUFcidade*************************************
        Dim RadDropDownListUf As New RadDropDownList
        Dim RadDropDownListCidades As New RadDropDownList
        Dim bairro_LI_LINHASTextBox As New RadTextBox
        Dim rua_LI_LINHASTextBox As New RadTextBox


        '*********************DetailTableCep*************************************
        Dim numEndereco_LI_LINHASRadNumericTextBox As New RadNumericTextBox
        Dim complemeto_LI_LINHASTextBox As New RadTextBox
        Dim numLinha_LI_LINHA As New RadMaskedTextBox

        Dim cep_LI_LINHASRadMaskedTextBox As New RadMaskedTextBox
        '*********************OBS*************************************
        Dim obs_LI_LINHASTextBox As New RadTextBox



        If e.CommandName = "Update" Or e.CommandName = "PerformInsert" Then



            For Each item As GridDataItem In RadGridLinhas.Items

                Select Case item.OwnerTableView.Name
                    Case "Master"
                        numContrato_LI_LINHASTextBox = DirectCast(item.FindControl("numContrato_LI_LINHASTextBox"), RadTextBox)
                        st_LI_LINHAS = DirectCast(item("st_LI_LINHAS").Controls(0), CheckBox)
                        id_OP_OPERADORASRadComboBox = DirectCast(item.FindControl("id_OP_OPERADORASRadComboBox"), RadComboBox)
                        codLinha_LI_LINHASTextBox = DirectCast(item.FindControl("codLinha_LI_LINHASTextBox"), RadTextBox)

                        Exit Select


                    Case "DetailVlLinha"
                        numLinha_LI_LINHAS = DirectCast(item.FindControl("numLinha_LI_LINHASRadMaskedTextBox"), RadMaskedTextBox)
                        GridDropDownColumnid_LI_TIPOS = DirectCast(item.FindControl("id_LI_TIPOSRadComboBox"), RadComboBox)
                        vlIdeal_LI_LINHAS = DirectCast(item.FindControl("vlIdeal_LI_LINHASRadNumericTextBox"), RadNumericTextBox)
                        vlInicial_id_LI_TIPOS = DirectCast(item.FindControl("vlInicial_id_LI_TIPOSRadNumericTextBox"), RadNumericTextBox)
                        Exit Select

                    Case "DetailTableDta"
                        diaVenc_LI_LINHASTextBox = DirectCast(item.FindControl("diaVenc_LI_LINHASTextBox"), RadNumericTextBox)
                        perIncial_LI_LINHASTextBox = DirectCast(item.FindControl("perIncial_LI_LINHASTextBox"), RadMaskedTextBox)
                        numF_LI_LINHASTextBox = DirectCast(item.FindControl("numF_LI_LINHASTextBox"), RadTextBox)
                        nomeUnidade_LI_LINHASTextBox = DirectCast(item.FindControl("RadDropDownListUniidades"), RadDropDownList)
                        Exit Select
                    Case "ForaAnalise"
                        foraAnalise_LI_LINHAS = DirectCast(item("foraAnalise_LI_LINHAS").Controls(0), CheckBox)
                        liCancelada_LI_LINHAS = DirectCast(item("liCancelada_LI_LINHAS").Controls(0), CheckBox)
                        Exit Select

                    Case "DetailTableUFcidade"
                        RadDropDownListUf = DirectCast(item.FindControl("RadDropDownListUf"), RadDropDownList)
                        RadDropDownListCidades = DirectCast(item.FindControl("RadDropDownListCidades"), RadDropDownList)
                        bairro_LI_LINHASTextBox = DirectCast(item.FindControl("bairro_LI_LINHASTextBox"), RadTextBox)
                        rua_LI_LINHASTextBox = DirectCast(item.FindControl("rua_LI_LINHASTextBox"), RadTextBox)
                        Exit Select
                    Case "DetailTableCep"
                        numEndereco_LI_LINHASRadNumericTextBox = DirectCast(item.FindControl("numEndereco_LI_LINHASRadNumericTextBox"), RadNumericTextBox)
                        complemeto_LI_LINHASTextBox = DirectCast(item.FindControl("complemeto_LI_LINHASTextBox"), RadTextBox)
                        numLinha_LI_LINHA = DirectCast(item.FindControl("numLinha_LI_LINHASRadMaskedTextBox"), RadMaskedTextBox)
                        cep_LI_LINHASRadMaskedTextBox = DirectCast(item.FindControl("cep_LI_LINHASRadMaskedTextBox"), RadMaskedTextBox)
                        Exit Select
                    Case "DetailTableObservacoes"
                        obs_LI_LINHASTextBox = DirectCast(item.FindControl("obs_LI_LINHASTextBox"), RadTextBox)
                        Exit Select

                End Select

            Next
            If e.CommandName = "Update" Or e.CommandName = "PerformInsert" Then
                SqlDataSourceContatosLinhas.UpdateParameters("id_PS_CLIENTES").DefaultValue = Request.QueryString("id_cliente")
                SqlDataSourceContatosLinhas.UpdateParameters("id_LI_TIPOS").DefaultValue = GridDropDownColumnid_LI_TIPOS.SelectedValue
                SqlDataSourceContatosLinhas.UpdateParameters("vlInicial_id_LI_TIPOS").DefaultValue = vlInicial_id_LI_TIPOS.Text
                SqlDataSourceContatosLinhas.UpdateParameters("numContrato_LI_LINHAS").DefaultValue = numContrato_LI_LINHASTextBox.Text
                SqlDataSourceContatosLinhas.UpdateParameters("numLinha_LI_LINHAS").DefaultValue = numLinha_LI_LINHAS.Text
                SqlDataSourceContatosLinhas.UpdateParameters("vlIdeal_LI_LINHAS").DefaultValue = vlIdeal_LI_LINHAS.Text
                SqlDataSourceContatosLinhas.UpdateParameters("diaVenc_LI_LINHAS").DefaultValue = diaVenc_LI_LINHASTextBox.Text
                SqlDataSourceContatosLinhas.UpdateParameters("foraAnalise_LI_LINHAS").DefaultValue = If(foraAnalise_LI_LINHAS.Checked = True, "1", "0")
                SqlDataSourceContatosLinhas.UpdateParameters("st_LI_LINHAS").DefaultValue = If(st_LI_LINHAS.Checked = True, "1", "0")
                SqlDataSourceContatosLinhas.UpdateParameters("liCancelada_LI_LINHAS").DefaultValue = If(liCancelada_LI_LINHAS.Checked = True, "1", "0")
                SqlDataSourceContatosLinhas.UpdateParameters("numF_LI_LINHAS").DefaultValue = numF_LI_LINHASTextBox.Text
                SqlDataSourceContatosLinhas.UpdateParameters("perIncial_LI_LINHAS").DefaultValue = perIncial_LI_LINHASTextBox.TextWithLiterals
                SqlDataSourceContatosLinhas.UpdateParameters("id_PS_CIDADES").DefaultValue = RadDropDownListCidades.SelectedValue
                SqlDataSourceContatosLinhas.UpdateParameters("bairro_LI_LINHAS").DefaultValue = bairro_LI_LINHASTextBox.Text
                SqlDataSourceContatosLinhas.UpdateParameters("rua_LI_LINHAS").DefaultValue = rua_LI_LINHASTextBox.Text
                SqlDataSourceContatosLinhas.UpdateParameters("numEndereco_LI_LINHAS").DefaultValue = numEndereco_LI_LINHASRadNumericTextBox.Text
                SqlDataSourceContatosLinhas.UpdateParameters("complemeto_LI_LINHAS").DefaultValue = complemeto_LI_LINHASTextBox.Text
                SqlDataSourceContatosLinhas.UpdateParameters("cep_LI_LINHAS").DefaultValue = cep_LI_LINHASRadMaskedTextBox.Text
                SqlDataSourceContatosLinhas.UpdateParameters("id_LI_LINHAS").DefaultValue = Request.QueryString("id_LI_LINHAS")
                SqlDataSourceContatosLinhas.UpdateParameters("id_OP_OPERADORAS").DefaultValue = id_OP_OPERADORASRadComboBox.SelectedValue
                SqlDataSourceContatosLinhas.UpdateParameters("codLinha_LI_LINHAS").DefaultValue = codLinha_LI_LINHASTextBox.Text
                SqlDataSourceContatosLinhas.UpdateParameters("nomeUnidade_LI_LINHAS").DefaultValue = nomeUnidade_LI_LINHASTextBox.SelectedText
                SqlDataSourceContatosLinhas.Update()
                Call VoltarPaginaAnterior()
            End If
        End If

        If e.CommandName = "Cancel" Then
            Call VoltarPaginaAnterior()
        End If
    End Sub

    Protected Sub id_LI_TIPOSRadComboBox_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs)
        Dim combo As RadComboBox = DirectCast(sender, RadComboBox)
        Dim item As GridDataItem = DirectCast(combo.NamingContainer, GridDataItem)
        Dim HyperLinkNovoRamal As HyperLink = DirectCast(item.FindControl("HyperLinkNovoRamal"), HyperLink)


        If combo.SelectedItem.Text = "DDR" Then
            combo.Width = Unit.Percentage(80)
            HyperLinkNovoRamal.Visible = True
        Else
            combo.Width = Unit.Percentage(100)
            HyperLinkNovoRamal.Visible = False
        End If




    End Sub
End Class