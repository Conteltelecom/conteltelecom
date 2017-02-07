Public Class Validacoes
    Function BuscaMesAnoAtual() As String

        Return Date.Today.Month & "/" & Date.Today.Year



    End Function
    Public Shared Function FormatarMesRef(StrMesRef As String, ByVal TipoRetorno As Integer) As String
        ' TipoRetorno = 1 EX=01/2000
        ' TipoRetorno = 0 EX=Janeiro/2000
        If IsDate(StrMesRef) Then


            Dim mes As String = StrMesRef.Substring(0, StrMesRef.Length - 5)
            Dim ano As String = StrMesRef.Substring(StrMesRef.Length - 4)

            If TipoRetorno = 0 Then
                StrMesRef = MonthName(mes) & "/" & ano
            ElseIf TipoRetorno = 1 Then
                StrMesRef = mes & "/" & ano
            End If
        End If

        Return StrMesRef
    End Function


    Public Shared Function FormatarCep(Strcep As Object) As String

        Try
            If IsNumeric(Strcep.ToString) = True Then

                Dim Intcep As Int64 = Convert.ToInt64(Strcep)


                Return String.Format("{0:#####\-###}", Intcep)
            End If
        Catch ex As Exception



            Throw ex
        End Try
        Return String.Format("{0:#####\-###}", "           ")
    End Function
    Public Function CpfFormat(cpf As Object) As String

        Try
            If IsNumeric(cpf.ToString) = True Then

                Dim iCpf As Int64 = Convert.ToInt64(cpf)


                Return String.Format("{0:###\.###\.###-##}", cpf)
            End If
        Catch ex As Exception



            Throw ex
        End Try
        Return String.Format("{0:###\.###\.###-##}", "           ")
    End Function

    Public Shared Function CNPJFormat(cnpj As Object) As String

        Try
            If IsNumeric(cnpj.ToString) = True Then

                '  Dim iCpf As Int64 = Convert.ToInt64(cnpj)
                If cnpj.ToString.Length <= 11 Then

                    Return (String.Format("{0:###\.###\.###\-##}", Convert.ToInt64(cnpj))).PadLeft(15, "0")
                Else
                    Return String.Format("{0:##\.###\.###\/####\-##}", Convert.ToInt64(cnpj)).PadLeft(18, "0")
                End If


            End If
        Catch ex As Exception



            Throw ex
        End Try
        Return String.Format("{0:##\.###\.###\/####\-##}", "               ")
    End Function
    Public Shared Function TelefoneFormat(Fone As Object) As String

        Try

            If IsNumeric(Fone.ToString) = True Then
                Dim iFone As Int64 = Convert.ToInt64(Fone)



                If iFone.ToString.Length > 10 Then
                    If iFone.ToString.Substring(0, 1) = 0 Then
                        Return String.Format("{0:####\ ###\ ####}", iFone)
                    Else

                        Return String.Format("{0:(##\) #####\-####}", iFone)
                    End If


                Else
                    If iFone.ToString.Length < 9 Then
                        If iFone.ToString.Substring(0, 1) = 0 Then
                            Return String.Format("{0:####\ ######}", iFone)
                        Else
                            Return String.Format("{0:(##\) ###\-####}", iFone)
                        End If

                    Else
                        Return String.Format("{0:(##\) ####\-####}", iFone)
                    End If


                End If
            End If

        Catch ex As Exception

            Throw ex
        End Try
        Return String.Format("{0:(##\) ####\-####}", "           ")
    End Function
    Public Function TelefoneFormat2(Fone As Object) As String

        Try

            If IsNumeric(Fone.ToString) = True Then
                Dim iFone As Int64 = Convert.ToInt64(Fone)
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

        Catch ex As Exception

            Throw ex
        End Try
        Return String.Format("{0:(##\) ####\-####}", "           ")
    End Function
    Public Function ValidaCPF(ByVal CPF As String) As Integer
        '0  VALIDO
        '1  CPF INVALIDO
        '3  JA CADATRADO

        Dim soma As Integer
        Dim Resto As Integer
        Dim i As Integer
        'Valida argumento
        If Len(CPF) <> 11 Then
            Return 1
            Exit Function
        End If
        soma = 0
        For i = 1 To 9
            soma = soma + Val(Mid$(CPF, i, 1)) * (11 - i)
        Next i
        Resto = 11 - (soma - (Int(soma / 11) * 11))
        If Resto = 10 Or Resto = 11 Then Resto = 0
        If Resto <> Val(Mid$(CPF, 10, 1)) Then
            Return 1
            Exit Function
        End If
        soma = 0
        For i = 1 To 10
            soma = soma + Val(Mid$(CPF, i, 1)) * (12 - i)
        Next i
        Resto = 11 - (soma - (Int(soma / 11) * 11))
        If Resto = 10 Or Resto = 11 Then Resto = 0
        If Resto <> Val(Mid$(CPF, 11, 1)) Then
            If CPFcadastrado(CPF) = True Then
                Return 2
            Else
                Return 1
            End If

            Exit Function
        End If

        Return 0
    End Function

    Public Function UltimoId_PS_PESSOA() As Integer

        Dim ClsUltimoId_PS_PESSOA As New conteltelecom.BuscaUltimaPessoaTableAdapters.QueriesTableAdapter
        Dim scalarQueriesTableAdapter As conteltelecom.BuscaUltimaPessoaTableAdapters.QueriesTableAdapter
        scalarQueriesTableAdapter = New conteltelecom.BuscaUltimaPessoaTableAdapters.QueriesTableAdapter()

        Dim returnValue As Integer
        returnValue = CType(scalarQueriesTableAdapter.ScalarQueryMaxId_PS_PESSOA(), Integer)

        Return returnValue

    End Function
    Private Function CPFcadastrado(ByVal cpf As String) As Boolean
        Dim CslValidaCPF As New conteltelecom.ValidaCPFTableAdapters.QueriesTableAdapter
        Dim scalarQueriesTableAdapter As conteltelecom.ValidaCPFTableAdapters.QueriesTableAdapter
        scalarQueriesTableAdapter = New conteltelecom.ValidaCPFTableAdapters.QueriesTableAdapter()

        Dim returnValue As Integer
        returnValue = CType(scalarQueriesTableAdapter.BuscaCPF(cpf), Integer)

        If returnValue = cpf Then
            Return True
        End If
        Return False
    End Function

    Public Function ValidaCodPessoa(ByRef Id_pessoa As String, ByRef cpf As String, ByRef nome As String) As Boolean

        Dim CustomersTableAdapter1 As conteltelecom.BuscaCPF_NomexsdTableAdapters.BuscaCPF_NomeTableAdapter
        CustomersTableAdapter1 = New conteltelecom.BuscaCPF_NomexsdTableAdapters.BuscaCPF_NomeTableAdapter
        If IsNumeric(cpf) = True Then

        End If


        For Each q In CustomersTableAdapter1.GetData(If(IsNumeric(Id_pessoa) = True, Id_pessoa, Nothing), If(IsNumeric(cpf) = True, cpf, Nothing))
            cpf = q("cpf_PS_FISICA")
            nome = q("desc_PS_PESSOA")
            Id_pessoa = ("id_PS_PESSOA")
            Return True
        Next

        Return False
    End Function

    Public Function BuscaDadosPessoas(ByRef Id_pessoa As String, ByRef Fone01 As String, ByRef Fone02 As String, ByRef nome As String) As Boolean

        Dim CustomersTableAdapter1 As conteltelecom.BuscaCPF_NomexsdTableAdapters.RadAutoCompleteBox_Ps_FisicaTableAdapter
        CustomersTableAdapter1 = New conteltelecom.BuscaCPF_NomexsdTableAdapters.RadAutoCompleteBox_Ps_FisicaTableAdapter



        For Each q In CustomersTableAdapter1.GetData(If(IsNumeric(Id_pessoa) = True, Id_pessoa, Nothing))
            Fone01 = TelefoneFormat(q("fone01_PS_FISICA"))
            Fone02 = TelefoneFormat(q("fone02_PS_FISICA"))
            nome = q("desc_PS_PESSOA")
            Id_pessoa = q("id_PS_PESSOA")
            Return True
        Next

        Return False
    End Function
    Public Function BuscaRazaoSocial_Operadora(ByRef RazaoSocial As Label, ByRef descOperadora As Label,
  ByRef id_LI_LINHAS As Integer, ByRef id_OP_OPERADORAS As Integer,
  ByRef id_LI_TIPOS As Integer, ByRef id_PS_CIDADES As Integer _
 , ByRef codMatriz_PS_CLIENTES As Integer, ByRef id_PS_PESSOA As Integer _
 , ByRef vlInicial_id_LI_TIPOS As Decimal, ByRef perIncial_LI_LINHAS As String, ByRef foraAnalise_LI_LINHAS As Int16, ByRef nomeUnidade_LI_LINHAS As String, ByRef codLinha_LI_LINHAS As String) As Boolean

        Dim CustomersTableAdapter1 As conteltelecom.DataSetLinhasTableAdapters.Sp_BuscaRazaoSocialOperadora_x_LinhaTableAdapter
        CustomersTableAdapter1 = New conteltelecom.DataSetLinhasTableAdapters.Sp_BuscaRazaoSocialOperadora_x_LinhaTableAdapter

        For Each q In CustomersTableAdapter1.GetDataBy(If(IsNumeric(id_LI_LINHAS) = True, id_LI_LINHAS, Nothing))

            If IsDBNull(q("razaosocial_PS_JURIDICA")) = False Then
                RazaoSocial.Text = q("razaosocial_PS_JURIDICA")
            End If
            If IsDBNull(q("desc_OP_OPERADORAS")) = False Then
                descOperadora.Text = q("desc_OP_OPERADORAS")
            End If
            ' id_LI_LINHAS = q("id_LI_LINHAS")
            If IsDBNull(q("id_OP_OPERADORAS")) = False Then
                id_OP_OPERADORAS = q("id_OP_OPERADORAS")
            End If
            If IsDBNull(q("id_LI_TIPOS")) = False Then
                id_LI_TIPOS = q("id_LI_TIPOS")
            End If
            If IsDBNull(q("id_PS_CIDADES")) = False Then
                id_PS_CIDADES = q("id_PS_CIDADES")
            Else
                id_PS_CIDADES = 0
            End If

            If IsDBNull(q("codMatriz_PS_CLIENTES")) = False Then
                codMatriz_PS_CLIENTES = q("codMatriz_PS_CLIENTES")
            End If
            If IsDBNull(q("id_PS_PESSOA")) = False Then
                id_PS_PESSOA = q("id_PS_PESSOA")
            End If
            If IsDBNull(q("vlInicial_id_LI_TIPOS")) = False Then
                vlInicial_id_LI_TIPOS = q("vlInicial_id_LI_TIPOS")
            End If
            If IsDBNull(q("perIncial_LI_LINHAS")) = False Then
                perIncial_LI_LINHAS = q("perIncial_LI_LINHAS")
            End If
            If IsDBNull(q("foraAnalise_LI_LINHAS")) = False Then
                foraAnalise_LI_LINHAS = q("foraAnalise_LI_LINHAS")
            End If
            If IsDBNull(q("nomeUnidade_LI_LINHAS")) = False Then
                nomeUnidade_LI_LINHAS = q("nomeUnidade_LI_LINHAS")
            End If

            If IsDBNull(q("codLinha_LI_LINHAS")) = False Then
                codLinha_LI_LINHAS = q("codLinha_LI_LINHAS")
            End If

            Return True
        Next


        Return False

    End Function
    Public Shared Function SomenteNumeros(ByVal strNumero As String) As String

        Dim re As New Regex("[0-9]")
        Dim s As New StringBuilder()

        For Each m As Match In re.Matches(strNumero)
            s.Append(m.Value)
        Next
        Return (s.ToString)
    End Function
    Public Function BuscaValorContrato(ByRef vl_contrato As Double, ByRef id_CL_TIPOS_CONTRATOS As Integer, ByVal codMatriz_PS_CLIENTES As Integer) As Boolean

        Dim CustomersTableAdapter1 As conteltelecom.DataSetLinhasTableAdapters.CL_CAD_CONTRATOSTableAdapter
        CustomersTableAdapter1 = New conteltelecom.DataSetLinhasTableAdapters.CL_CAD_CONTRATOSTableAdapter

        For Each q In CustomersTableAdapter1.GetData(If(IsNumeric(codMatriz_PS_CLIENTES) = True, codMatriz_PS_CLIENTES, Nothing))

            If IsDBNull(q("vl_contrato")) = False Then
                vl_contrato = q("vl_contrato")
            End If
            If IsDBNull(q("id_CL_TIPOS_CONTRATOS")) = False Then
                id_CL_TIPOS_CONTRATOS = q("id_CL_TIPOS_CONTRATOS")
            End If
            ' id_LI_LINHAS = q("id_LI_LINHAS")

            Return True
        Next


        Return False

    End Function

    Public Function BuscaDadosPs_Juridica(ByRef Id_pessoa As String, ByRef nome As String) As Boolean

        Dim CustomersTableAdapter1 As conteltelecom.BuscaCPF_NomexsdTableAdapters.RadAutoCompleteBoxPs_JuridicaTableAdapter
        CustomersTableAdapter1 = New conteltelecom.BuscaCPF_NomexsdTableAdapters.RadAutoCompleteBoxPs_JuridicaTableAdapter

        For Each q In CustomersTableAdapter1.GetData(If(IsNumeric(Id_pessoa) = True, Id_pessoa, Nothing))

            nome = q("desc_PS_PESSOA")
            Id_pessoa = q("id_PS_PESSOA")
            Return True
        Next

        Return False
    End Function

    Public Function ValidaMesCadatrado(ByVal mesAnoRefereincia_SF_SERVICOS_FATURA As String, ByVal id_linha As Integer) As Integer

        Dim ClsUltimoId_PS_PESSOA As New conteltelecom.DataSetValidaMesTableAdapters.QueriesTableAdapter
        Dim scalarQueriesTableAdapter As conteltelecom.DataSetValidaMesTableAdapters.QueriesTableAdapter
        scalarQueriesTableAdapter = New conteltelecom.DataSetValidaMesTableAdapters.QueriesTableAdapter()

        Dim returnValue As Integer
        returnValue = CType(scalarQueriesTableAdapter.ScalarQuery(mesAnoRefereincia_SF_SERVICOS_FATURA, id_linha), Integer)

        Return returnValue

    End Function
End Class


