Imports System.Data.SqlClient
Imports Telerik.Web.UI
Imports conteltelecom.JavaScript



Public Class cl_contratos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub

    Private Sub RadGridContratos_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridContratos.ItemCommand

        If e.CommandName = RadGrid.PerformInsertCommandName Then



            Dim editItem As GridEditableItem = TryCast(e.Item, GridEditableItem)
            Dim parentItem As GridDataItem = e.Item.OwnerTableView.ParentItem


            'Code to insert to main grid
            If e.Item.OwnerTableView.Name = "normal" Then
                Dim RadComboBoxTiposIns As New RadComboBox
                Dim st_CL_TIPOS_CONTRATOS As New CheckBox
                Dim dt_fim_CL_TIPOS_CONTRATOS As New RadDatePicker
                Dim dt_inici_CL_TIPOS_CONTRATOS As New RadDatePicker
                Dim vl_contrato As RadNumericTextBox
                RadComboBoxTiposIns = DirectCast(editItem("id_CL_TIPOS_CONTRATOS").Controls(0), RadComboBox)
                st_CL_TIPOS_CONTRATOS = DirectCast(editItem("st_CL_TIPOS_CONTRATOS").Controls(0), CheckBox)
                dt_fim_CL_TIPOS_CONTRATOS = DirectCast(editItem("dt_fim_CL_TIPOS_CONTRATOS").Controls(0), RadDatePicker)
                dt_inici_CL_TIPOS_CONTRATOS = DirectCast(editItem("dt_inici_CL_TIPOS_CONTRATOS").Controls(0), RadDatePicker)
                vl_contrato = DirectCast(editItem.FindControl("vl_contratoRadNumericTextBox"), RadNumericTextBox)
                SqlDataSourceContratos.InsertParameters("dt_inici_CL_TIPOS_CONTRATOS").DefaultValue = dt_inici_CL_TIPOS_CONTRATOS.DateInput.SelectedDate
                SqlDataSourceContratos.InsertParameters("dt_fim_CL_TIPOS_CONTRATOS").DefaultValue = dt_fim_CL_TIPOS_CONTRATOS.DateInput.SelectedDate
                SqlDataSourceContratos.InsertParameters("id_CL_TIPOS_CONTRATOS").DefaultValue = RadComboBoxTiposIns.SelectedValue
                SqlDataSourceContratos.InsertParameters("vl_contrato").DefaultValue = vl_contrato.DbValue.ToString

                SqlDataSourceContratos.InsertParameters("st_CL_TIPOS_CONTRATOS").DefaultValue = If(st_CL_TIPOS_CONTRATOS.Checked = True, 1, 0)


            ElseIf e.Item.OwnerTableView.Name = "Anexos" Then
                Dim ClsAnexos As New Anexos
                Dim RadUploadAnexosContrato As RadAsyncUpload = DirectCast(editItem.FindControl("RadUploadAnexosContrato"), RadAsyncUpload)

                Dim attachment As UploadedFile = RadUploadAnexosContrato.UploadedFiles(0)

                ' create byte array
                Dim attachmentBytes As Byte() = New Byte(attachment.InputStream.Length - 1) {}

                ' read attachment into attachmentBytes
                attachment.InputStream.Read(attachmentBytes, 0, attachmentBytes.Length)

                Dim documento As Byte() = attachmentBytes
                Dim mime As String = attachment.ContentType
                Dim nomeAnexo As String = attachment.FileName
                Dim id_CL_CAD_CONTRATOS As Integer = Request.QueryString("id_pessoas")
                ClsAnexos.Upload(nomeAnexo, mime, documento, 1, id_CL_CAD_CONTRATOS)

            End If
        End If
        If e.CommandName = RadGrid.DeleteCommandName Then


            '    RadWindowManagerMsg.RadAlert("ATENÇÃO CIDADE NÃO CADATRADA", 400, Nothing, "MESNAGEM", Nothing)
            ' Session("DeleteValor") = e.CommandArgument
            e.Canceled = True

        End If
        If e.CommandName = "DeleteChecked" Then
            SqlDataSourceAnexos.DeleteParameters("id_ANEXO").DefaultValue = Session("DeleteValor")
            SqlDataSourceAnexos.Delete()
            Session.Remove("DeleteValor")
        End If


    End Sub

End Class