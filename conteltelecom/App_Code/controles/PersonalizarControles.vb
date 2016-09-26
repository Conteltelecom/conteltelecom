Imports Telerik.Web.UI


Public Class PersonalizarControles
    Inherits System.Web.UI.Page
    Public Shared Sub SubRadGrid(ByRef P_RadGrid As RadGrid, ByVal pTipoModoEdicao As Int16)




        Select Case pTipoModoEdicao
            Case 0
                P_RadGrid.MasterTableView.EditMode = GridEditMode.InPlace

                Exit Select
            Case 1
                P_RadGrid.MasterTableView.EditMode = GridEditMode.EditForms
                P_RadGrid.MasterTableView.EditFormSettings.EditFormType = GridEditFormType.Template
                P_RadGrid.MasterTableView.EditFormSettings.EditColumn.CancelImageUrl = "~\img\block_32.png"
                '  P_RadGrid.MasterTableView.EditFormSettings.FormTableStyle.Width = Unit.Percentage(100)
                '  P_RadGrid.MasterTableView.EditFormSettings.FormTableStyle.CssClass = "table"

                Exit Select
            Case 2
                Exit Select
            Case 3

        End Select



        '################################################################################################ 
        P_RadGrid.RenderMode = RenderMode.Auto

        P_RadGrid.Skin = "Bootstrap"
        If pTipoModoEdicao = 3 Then
            P_RadGrid.MasterTableView.CommandItemSettings.ShowAddNewRecordButton = False

        End If
        P_RadGrid.CellSpacing = "0"
        P_RadGrid.GridLines = GridLines.None
        P_RadGrid.AutoGenerateColumns = False
        P_RadGrid.MasterTableView.CommandItemDisplay = Telerik.Web.UI.GridCommandItemDisplay.Top
        P_RadGrid.MasterTableView.CommandItemStyle.CssClass = "rgEditForm"

        P_RadGrid.MasterTableView.CommandItemSettings.AddNewRecordText = "NOVO"
        P_RadGrid.MasterTableView.CommandItemSettings.AddNewRecordImageUrl = "~\img\add.png"
        P_RadGrid.MasterTableView.CommandItemSettings.ShowRefreshButton = False
            P_RadGrid.MasterTableView.CommandItemSettings.ShowPrintButton = False
            P_RadGrid.MasterTableView.CommandItemSettings.PrintGridText = "IMPRIMIR"
            P_RadGrid.MasterTableView.CommandItemSettings.ExportToExcelImageUrl = "~\img\Excel_32.png"
            P_RadGrid.MasterTableView.CommandItemSettings.ShowExportToExcelButton = True
            P_RadGrid.MasterTableView.CommandItemSettings.ExportToExcelText = ""
            P_RadGrid.MasterTableView.EditFormSettings.EditColumn.ButtonType = GridButtonColumnType.ImageButton
            P_RadGrid.MasterTableView.EditFormSettings.EditColumn.EditImageUrl = "~\img\edit_32.png"
            P_RadGrid.MasterTableView.EditFormSettings.EditColumn.UpdateImageUrl = "~\img\accept_32.png"
            P_RadGrid.MasterTableView.EditFormSettings.EditColumn.InsertImageUrl = "~\img\accept_32.png"
            P_RadGrid.MasterTableView.EditFormSettings.EditColumn.CancelImageUrl = "~\img\block_32.png"
        P_RadGrid.MasterTableView.PageSize = 30
        P_RadGrid.MasterTableView.EnableSplitHeaderText = False 'EVITA QUEBA DE LINHA NA  NO CABEÇALHO
        P_RadGrid.MasterTableView.NoMasterRecordsText = "SEM REGISTRO"
        '################################################################################################ 
        P_RadGrid.GroupPanel.Text = "ARRASTE  A COLUNA PARA FILTAR"
            P_RadGrid.GroupingSettings.CollapseAllTooltip = "DESAGRUPAR"
        P_RadGrid.GroupingSettings.ShowUnGroupButton = True
        P_RadGrid.ShowGroupPanel = True
        P_RadGrid.GroupingSettings.CollapseTooltip = "RECOLHER GRUPO"
        P_RadGrid.ClientSettings.AllowDragToGroup = True
        P_RadGrid.ClientSettings.AllowColumnsReorder = True
        P_RadGrid.ClientSettings.ReorderColumnsOnClient = True
        P_RadGrid.ClientSettings.Selecting.AllowRowSelect = True
        P_RadGrid.ExportSettings.ExportOnlyData = True
        P_RadGrid.GroupingSettings.CollapseAllTooltip = "Fechar todos"
        P_RadGrid.AllowPaging = True


        '###############################################  GridExcelExportFormat ################################################# 
        P_RadGrid.ExportSettings.Excel.Format = GridExcelExportFormat.Xlsx
            P_RadGrid.ExportSettings.ExportOnlyData = True
            P_RadGrid.ExportSettings.ExportOnlyData = True
            P_RadGrid.ExportSettings.HideStructureColumns = True
            P_RadGrid.ExportSettings.IgnorePaging = True
            P_RadGrid.ExportSettings.OpenInNewWindow = True

        For Each column As GridColumn In P_RadGrid.MasterTableView.RenderColumns
            If column.ColumnType = "GridEditCommandColumn" Then
                Dim editcol As GridEditCommandColumn = DirectCast(column, GridEditCommandColumn)
                editcol.ButtonType = GridButtonColumnType.ImageButton
                editcol.ItemStyle.CssClass="rgEditForm"
                editcol.EditImageUrl = "~\img\edit_32.png"
                editcol.UpdateImageUrl = "~\img\accept_32.png"
                editcol.InsertImageUrl = "~\img\accept_32.png"
                editcol.CancelImageUrl = "~\img\block_32.png"
                Exit For
            End If
        Next



        For Each column As GridColumn In P_RadGrid.MasterTableView.RenderColumns


            If column.UniqueName = "Excluir" Then
                Dim excluirCol As GridButtonColumn = DirectCast(column, GridButtonColumn)
                excluirCol.ButtonType = GridButtonColumnType.ImageButton
                excluirCol.ItemStyle.CssClass = "rgEditForm"
                excluirCol.ImageUrl = "~\img\delete_32.png"
                excluirCol.ConfirmDialogType = GridConfirmDialogType.RadWindow
                excluirCol.ConfirmDialogWidth = 300
                excluirCol.ConfirmDialogHeight = 200
                excluirCol.CommandName = RadGrid.DeleteCommandName
                excluirCol.ConfirmText = "ATENÇÃO O REGISTRO SERA EXCLUÍDO"

            End If


        Next

        Dim _SubRadGridFilhos As New PersonalizarControles

        _SubRadGridFilhos.SubRadGridFilhos(P_RadGrid)


    End Sub
    Public Sub SubRadGridFilhos(ByRef P_RadGrid As RadGrid)
        If P_RadGrid.MasterTableView.DetailTables.Count > 0 Then
            For Each value As String In P_RadGrid.MasterTableView.DetailTables.Count.ToString
                value = value - 1
                P_RadGrid.MasterTableView.DetailTables.Item(value).CellSpacing = "0"
                P_RadGrid.MasterTableView.DetailTables.Item(value).GridLines = GridLines.None
                P_RadGrid.MasterTableView.DetailTables.Item(value).AutoGenerateColumns = False
                P_RadGrid.MasterTableView.DetailTables.Item(value).CommandItemDisplay = Telerik.Web.UI.GridCommandItemDisplay.Top
                P_RadGrid.MasterTableView.DetailTables.Item(value).CommandItemStyle.CssClass = "rgEditForm"

                P_RadGrid.MasterTableView.DetailTables.Item(value).CommandItemSettings.AddNewRecordText = "NOVO"
                P_RadGrid.MasterTableView.DetailTables.Item(value).CommandItemSettings.AddNewRecordImageUrl = "~\img\add.png"
                P_RadGrid.MasterTableView.DetailTables.Item(value).CommandItemSettings.ShowRefreshButton = False
                P_RadGrid.MasterTableView.DetailTables.Item(value).CommandItemSettings.ShowPrintButton = False
                P_RadGrid.MasterTableView.DetailTables.Item(value).CommandItemSettings.PrintGridText = "IMPRIMIR"
                P_RadGrid.MasterTableView.DetailTables.Item(value).CommandItemSettings.ExportToExcelImageUrl = "~\img\Excel_32.png"
                P_RadGrid.MasterTableView.DetailTables.Item(value).CommandItemSettings.ShowExportToExcelButton = True
                P_RadGrid.MasterTableView.DetailTables.Item(value).CommandItemSettings.ExportToExcelText = ""
                P_RadGrid.MasterTableView.DetailTables.Item(value).EditFormSettings.EditColumn.ButtonType = GridButtonColumnType.ImageButton
                P_RadGrid.MasterTableView.DetailTables.Item(value).EditFormSettings.EditColumn.EditImageUrl = "~\img\edit_32.png"
                P_RadGrid.MasterTableView.DetailTables.Item(value).EditFormSettings.EditColumn.UpdateImageUrl = "~\img\accept_32.png"
                P_RadGrid.MasterTableView.DetailTables.Item(value).EditFormSettings.EditColumn.InsertImageUrl = "~\img\accept_32.png"
                P_RadGrid.MasterTableView.DetailTables.Item(value).EditFormSettings.EditColumn.CancelImageUrl = "~\img\block_32.png"
                P_RadGrid.MasterTableView.DetailTables.Item(value).PageSize = 30
                P_RadGrid.MasterTableView.DetailTables.Item(value).EnableSplitHeaderText = False 'EVITA QUEBA DE LINHA NA  NO CABEÇALHO
                P_RadGrid.MasterTableView.DetailTables.Item(value).NoMasterRecordsText = "SEM REGISTRO"
                P_RadGrid.MasterTableView.DetailTables.Item(value).NoDetailRecordsText = " "
                '################################################################################################ 
                For Each column As GridColumn In P_RadGrid.MasterTableView.DetailTables.Item(value).RenderColumns
                    If column.ColumnType = "GridEditCommandColumn" Then
                        Dim editcol As GridEditCommandColumn = DirectCast(column, GridEditCommandColumn)
                        editcol.ButtonType = GridButtonColumnType.ImageButton
                        editcol.ItemStyle.CssClass = "rgEditForm"
                        editcol.EditImageUrl = "~\img\edit_32.png"
                        editcol.UpdateImageUrl = "~\img\accept_32.png"
                        editcol.InsertImageUrl = "~\img\accept_32.png"
                        editcol.CancelImageUrl = "~\img\block_32.png"
                        Exit For
                    End If
                Next



                For Each column As GridColumn In P_RadGrid.MasterTableView.DetailTables.Item(value).RenderColumns


                    If column.UniqueName = "Excluir" Then
                        Dim excluirCol As GridButtonColumn = DirectCast(column, GridButtonColumn)
                        excluirCol.ButtonType = GridButtonColumnType.ImageButton
                        excluirCol.ItemStyle.CssClass = "rgEditForm"
                        excluirCol.ImageUrl = "~\img\delete_32.png"
                        excluirCol.ConfirmDialogType = GridConfirmDialogType.RadWindow
                        excluirCol.ConfirmDialogWidth = 300
                        excluirCol.ConfirmDialogHeight = 200
                        excluirCol.CommandName = RadGrid.DeleteCommandName
                        excluirCol.ConfirmText = "ATENÇÃO O REGISTRO SERA EXCLUÍDO"

                    End If


                Next







            Next


        End If

    End Sub


End Class
