Imports System.Data.SqlClient
Imports Telerik.Web.UI
Public Class Anexos

    Function Upload(nome_ANEXOS As String, mine_ANEXOS As String, data_ANEXOS As Byte(), categoria_ANEXO As Integer, identificador_ANEXOS As Integer) As Boolean

        Dim CslSqlConetion As New Sql

        Try
            Dim cnn As Data.SqlClient.SqlConnection
            Dim cmd As Data.SqlClient.SqlCommand
            Dim param As Data.SqlClient.SqlParameter
            Dim strSQL As String

            strSQL = "
            INSERT INTO ANEXOS
           (nome_ANEXOS
           ,data_ANEXOS
           ,categoria_ANEXO
           ,mine_ANEXOS
             ,identificador_ANEXOS)
         VALUES
            (@nome_ANEXOS
           ,@data_ANEXOS
           ,@categoria_ANEXO
           ,@mine_ANEXOS
            ,@identificador_ANEXOS)"

            'defina a string de conexão e cria uma nova conexão
            Dim connString As String = CslSqlConetion.StrConectionString
            cnn = New Data.SqlClient.SqlConnection(connString)

            'define o comando a ser executado
            cmd = New Data.SqlClient.SqlCommand(strSQL, cnn)

            'recebe os parâmetros DESCRIÇÃO
            param = New Data.SqlClient.SqlParameter("@nome_ANEXOS", Data.SqlDbType.VarChar)
            param.Value = nome_ANEXOS
            cmd.Parameters.Add(param)

            'NOME DO ANEXO
            param = New Data.SqlClient.SqlParameter("@data_ANEXOS", Data.SqlDbType.VarBinary)
            param.Value = data_ANEXOS
            cmd.Parameters.Add(param)

            param = New Data.SqlClient.SqlParameter("@categoria_ANEXO", Data.SqlDbType.Int)
            param.Value = categoria_ANEXO
            cmd.Parameters.Add(param)

            param = New Data.SqlClient.SqlParameter("@mine_ANEXOS", Data.SqlDbType.VarChar)
            param.Value = mine_ANEXOS
            cmd.Parameters.Add(param)
            param = New Data.SqlClient.SqlParameter("@identificador_ANEXOS", Data.SqlDbType.Int)
            param.Value = identificador_ANEXOS
            cmd.Parameters.Add(param)

            'abre a conexão
            cnn.Open()
            'executa a instrução SQL se retornar
            cmd.ExecuteNonQuery()
            'fecha a conexao
            cnn.Close()
            Return True
        Catch ex As Exception

            Return False
        End Try




    End Function
    Public Sub DownloadFile(ByVal id As Integer)
        Dim CslSqlConetion As New Sql

        Dim bytes As Byte()
        Dim fileName As String, contentType As String
        Dim constr As String = CslSqlConetion.StrConectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand()


                cmd.CommandText = " Select nome_ANEXOS,data_ANEXOS,mine_ANEXOS From ANEXOS Where id_ANEXOS=@Id"
                cmd.Parameters.AddWithValue("@Id", id)
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


    End Sub


    Public Sub AnexaArquivos(p_RadAsyncUploadAnexos As RadAsyncUpload)

    End Sub






End Class
