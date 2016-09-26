Imports Telerik.Web.UI
Imports conteltelecom.Validacoes

Public Class sf_solicitacao_fatura_pendecias
    Inherits System.Web.UI.Page
    Public Function CNPJFormat(cpf As Object) As String


        Return Validacoes.CNPJFormat(cpf)

    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridCnpj_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGridCnpj.ItemDataBound




        If TypeOf e.Item Is GridEditableItem And e.Item.IsInEditMode Then

            If TypeOf e.Item Is GridEditFormInsertItem OrElse TypeOf e.Item Is GridDataInsertItem Then
                ' insert item
            Else
                Dim item As GridEditableItem = TryCast(e.Item, GridEditableItem)
                Dim itemValue As String = item("id_LI_CAD_LINHA_CHAVE").Text
                'SqlDataSourceLinhaAgrupadas.SelectParameters("id_LI_CAD_LINHA_CHAVE").DefaultValue = itemValue
                Dim RadGridLinhasAgrupadas As RadGrid = DirectCast(item.FindControl("RadGridLinhasAgrupadas"), RadGrid)
                RadGridLinhasAgrupadas.DataBind()
                PersonalizarControles.SubRadGrid(RadGridLinhasAgrupadas, 3)

                For Each column As GridColumn In RadGridLinhasAgrupadas.MasterTableView.RenderColumns


                    If column.UniqueName = "Confirmar" Then

                        Dim excluirCol As GridButtonColumn = DirectCast(column, GridButtonColumn)
                        excluirCol.ButtonType = GridButtonColumnType.ImageButton
                        excluirCol.ItemStyle.CssClass = "rgEditForm"
                        excluirCol.ImageUrl = "~\img\accept_32.png"
                        excluirCol.ConfirmDialogType = GridConfirmDialogType.RadWindow
                        excluirCol.ConfirmDialogWidth = 300
                        excluirCol.ConfirmDialogHeight = 200
                        excluirCol.CommandName = RadGrid.DeleteCommandName
                        excluirCol.ConfirmText = "ATENÇÃO APÓS CONFIMAR O VALOR DA LINHA SERA LANÇADO COMO R$ 0,00  NO SISTEMA. VOCÊ TEM CERTEZA? "
                        excluirCol.ConfirmTitle = "CONFIRMAÇÃO DO VALOR DA LINHA"
                    End If


                Next


                RadGridLinhasAgrupadas.MasterTableView.DetailTables.Item(0).Caption = "<span style='font-weight:bold;color:black;text-align:center;'> OBSEVAÇÕES </span>"
                RadGridLinhasAgrupadas.MasterTableView.DetailTables.Item(0).EditMode = GridEditMode.InPlace
                RadGridLinhasAgrupadas.MasterTableView.DetailTables.Item(0).AllowAutomaticUpdates = True
                RadGridLinhasAgrupadas.MasterTableView.DetailTables.Item(0).AllowAutomaticInserts = True
                RadGridLinhasAgrupadas.MasterTableView.DetailTables.Item(0).AllowAutomaticDeletes = True
                RadGridLinhasAgrupadas.MasterTableView.EditMode = GridEditMode.InPlace
                RadGridLinhasAgrupadas.Rebind()

            End If


        End If


    End Sub

    Private Sub RadGridCnpj_PreRender(sender As Object, e As EventArgs) Handles RadGridCnpj.PreRender

        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridCnpj, 3)

            RadGridCnpj.Rebind()
        End If


    End Sub




End Class