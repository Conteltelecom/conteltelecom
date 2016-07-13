
Friend Class ListRelProjecao
    Public Property NumLinha_LI_LINHAS As String
    Public Property Desc_PS_CIDADES As String
    Public Property NomeUnidade_LI_LINHAS As String


    Public Property DtLdn_LI_CAD_PROGRAMACAO As Date
    Public Property DtPeriodoTarifacao As String
    Public Property ValorMes01 As Decimal
    Public Property ValorMes02 As Decimal
    Public Property ValorMes03 As Decimal
    Public Property ValorUso As Decimal
    Public Property TipoUso As Integer
    Public Property PossuiUso As Integer
    Public Property MesReferencia As String
    Public Property MesReferencia1 As String
    Public Property MesReferencia2 As String
    Public Property MesReferencia3 As String



    Public Sub New(ByVal numLinha_LI_LINHAS As String, ByVal desc_PS_CIDADES As String,
                 ByVal nomeUnidade_LI_LINHAS As String, ByVal tipoUso As Integer, ByVal dtLdn_LI_CAD_PROGRAMACAO As Date,
                 ByVal dtPeriodoTarifacao As String, ByVal valorMes01 As Decimal, ByVal valorMes02 As Decimal, ByVal valorMes03 As Decimal,
                  ByVal valorUso As Decimal, ByVal PossuiUso As Integer, ByVal MesReferencia As String, ByVal mesReferencia1 As String, ByVal mesReferencia2 As String, ByVal mesReferencia3 As String)


        Me.NumLinha_LI_LINHAS = numLinha_LI_LINHAS
        Me.Desc_PS_CIDADES = desc_PS_CIDADES
        Me.NomeUnidade_LI_LINHAS = nomeUnidade_LI_LINHAS
        Me.TipoUso = tipoUso
        Me.DtLdn_LI_CAD_PROGRAMACAO = dtLdn_LI_CAD_PROGRAMACAO
        Me.DtPeriodoTarifacao = dtPeriodoTarifacao
        Me.ValorMes01 = valorMes01
        Me.ValorMes02 = valorMes02
        Me.ValorMes03 = valorMes03
        Me.ValorUso = valorUso
        Me.MesReferencia1 = mesReferencia1
        Me.MesReferencia2 = mesReferencia2
        Me.MesReferencia3 = mesReferencia3
    End Sub
End Class
