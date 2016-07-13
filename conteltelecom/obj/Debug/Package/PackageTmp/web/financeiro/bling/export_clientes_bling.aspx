<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Normalmaster.master" CodeBehind="export_clientes_bling.aspx.vb" Inherits="conteltelecom.export_clientes_bling" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeadNormal" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderNormal" runat="server">
    <telerik:RadGrid ID="RadGridExportClinetsBling" runat="server" AutoGenerateColumns="False" Culture="pt-BR" DataSourceID="SqlDataSourceExportCVS_Blind" GroupPanelPosition="Top">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ExportSettings>
            <Pdf PageWidth="">
            </Pdf>
        </ExportSettings>
        <MasterTableView DataKeyNames="codigo" DataSourceID="SqlDataSourceExportCVS_Blind" CommandItemDisplay ="Top" >
            <CommandItemSettings ShowExportToCsvButton="true" />
            <Columns>
                <telerik:GridBoundColumn DataField="ID" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="codigo" FilterControlAltText="Filter codigo column" HeaderText="codigo" ReadOnly="True" SortExpression="codigo" UniqueName="codigo" DataType="System.Int32">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="nome" FilterControlAltText="Filter nome column" HeaderText="nome" SortExpression="nome" UniqueName="nome" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="fantasia" FilterControlAltText="Filter fantasia column" HeaderText="fantasia" SortExpression="fantasia" UniqueName="fantasia" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="endereco" FilterControlAltText="Filter endereco column" HeaderText="endereco" SortExpression="endereco" UniqueName="endereco" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="numero" FilterControlAltText="Filter numero column" HeaderText="numero" SortExpression="numero" UniqueName="numero" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="complemento" FilterControlAltText="Filter complemento column" HeaderText="complemento" SortExpression="complemento" UniqueName="complemento" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="bairro" FilterControlAltText="Filter bairro column" HeaderText="bairro" SortExpression="bairro" UniqueName="bairro" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="cep" FilterControlAltText="Filter cep column" HeaderText="cep" SortExpression="cep" UniqueName="cep">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="cidade" FilterControlAltText="Filter cidade column" HeaderText="cidade" SortExpression="cidade" UniqueName="cidade" ReadOnly="True">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="estador" FilterControlAltText="Filter estador column" HeaderText="estador" SortExpression="estador" UniqueName="estador">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="contatos" FilterControlAltText="Filter contatos column" HeaderText="contatos" ReadOnly="True" SortExpression="contatos" UniqueName="contatos">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="fone" FilterControlAltText="Filter fone column" HeaderText="fone" ReadOnly="True" SortExpression="fone" UniqueName="fone">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="fax" FilterControlAltText="Filter fax column" HeaderText="fax" ReadOnly="True" SortExpression="fax" UniqueName="fax">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="celular" FilterControlAltText="Filter celular column" HeaderText="celular" ReadOnly="True" SortExpression="celular" UniqueName="celular">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="email" FilterControlAltText="Filter email column" HeaderText="email" ReadOnly="True" SortExpression="email" UniqueName="email">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Web_Site" FilterControlAltText="Filter Web_Site column" HeaderText="Web_Site" ReadOnly="True" SortExpression="Web_Site" UniqueName="Web_Site">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tipo_pessoa" FilterControlAltText="Filter tipo_pessoa column" HeaderText="tipo_pessoa" ReadOnly="True" SortExpression="tipo_pessoa" UniqueName="tipo_pessoa">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="cnpj_cpf" DataType="System.Decimal" FilterControlAltText="Filter cnpj_cpf column" HeaderText="cnpj_cpf" SortExpression="cnpj_cpf" UniqueName="cnpj_cpf">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="IE_rg" FilterControlAltText="Filter IE_rg column" HeaderText="IE_rg" ReadOnly="True" SortExpression="IE_rg" UniqueName="IE_rg">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="IE_isento" FilterControlAltText="Filter IE_isento column" HeaderText="IE_isento" ReadOnly="True" SortExpression="IE_isento" UniqueName="IE_isento">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Situacao" FilterControlAltText="Filter Situacao column" HeaderText="Situacao" ReadOnly="True" SortExpression="Situacao" UniqueName="Situacao">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Observacoes" FilterControlAltText="Filter Observacoes column" HeaderText="Observacoes" ReadOnly="True" SortExpression="Observacoes" UniqueName="Observacoes">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Estado_civil" FilterControlAltText="Filter Estado_civil column" HeaderText="Estado_civil" ReadOnly="True" SortExpression="Estado_civil" UniqueName="Estado_civil">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Profissao" FilterControlAltText="Filter Profissao column" HeaderText="Profissao" ReadOnly="True" SortExpression="Profissao" UniqueName="Profissao">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Sexo" FilterControlAltText="Filter Sexo column" HeaderText="Sexo" ReadOnly="True" SortExpression="Sexo" UniqueName="Sexo">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Data_nascimento" FilterControlAltText="Filter Data_nascimento column" HeaderText="Data_nascimento" ReadOnly="True" SortExpression="Data_nascimento" UniqueName="Data_nascimento">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Naturalidade" FilterControlAltText="Filter Naturalidade column" HeaderText="Naturalidade" ReadOnly="True" SortExpression="Naturalidade" UniqueName="Naturalidade">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nome_pai" FilterControlAltText="Filter Nome_pai column" HeaderText="Nome_pai" ReadOnly="True" SortExpression="Nome_pai" UniqueName="Nome_pai">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CPF_pai" FilterControlAltText="Filter CPF_pai column" HeaderText="CPF_pai" ReadOnly="True" SortExpression="CPF_pai" UniqueName="CPF_pai">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Nome_mae" FilterControlAltText="Filter Nome_mae column" HeaderText="Nome_mae" ReadOnly="True" SortExpression="Nome_mae" UniqueName="Nome_mae">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CPF_mae" FilterControlAltText="Filter CPF_mae column" HeaderText="CPF_mae" ReadOnly="True" SortExpression="CPF_mae" UniqueName="CPF_mae">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Segmento" FilterControlAltText="Filter Segmento column" HeaderText="Segmento" ReadOnly="True" SortExpression="Segmento" UniqueName="Segmento">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Vendedor" FilterControlAltText="Filter Vendedor column" HeaderText="Vendedor" ReadOnly="True" SortExpression="Vendedor" UniqueName="Vendedor">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Tipo_Contato" FilterControlAltText="Filter Tipo_Contato column" HeaderText="Tipo_Contato" ReadOnly="True" SortExpression="Tipo_Contato" UniqueName="Tipo_Contato">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Email_para_envio_NFe" FilterControlAltText="Filter Email_para_envio_NFe column" HeaderText="Email_para_envio_NFe" ReadOnly="True" SortExpression="Email_para_envio_NFe" UniqueName="Email_para_envio_NFe">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSourceExportCVS_Blind" runat="server" ConnectionString="<%$ ConnectionStrings:conteltelecomConnectionString %>" SelectCommand="SELECT '' AS ID, PS_CLIENTES.id_PS_CLIENTES AS codigo, RTRIM(PS_JURIDICA.razaosocial_PS_JURIDICA) AS nome, RTRIM(PS_PESSOA.desc_PS_PESSOA) AS fantasia, RTRIM(PS_PESSOA.endereco_PS_PESSOA) AS endereco, RTRIM(PS_PESSOA.numEndereco_PS_PESSOA) AS numero, RTRIM(PS_PESSOA.complemeto_PS_PESSOA) AS complemento, RTRIM(PS_PESSOA.bairro_PS_PESSOA) AS bairro, PS_PESSOA.cep_PS_PESSOA AS cep, RTRIM(PS_CIDADES.desc_PS_CIDADES) AS cidade, PS_CIDADES.cod_PS_UF AS estador, 'JOAO' AS contatos, '54 3701-1471' AS fone, '' AS fax, '' AS celular, 'joao@silva.com.br' AS email, '' AS Web_Site, 'Pessoa Jurídica' AS tipo_pessoa, PS_JURIDICA.CNPJ_PS_JURIDICA AS cnpj_cpf, '' AS IE_rg, 'N' AS IE_isento, 'Ativo' AS Situacao, '' AS Observacoes, '' AS Estado_civil, 'Programador' AS Profissao, 'Masculino' AS Sexo, '06/03/1983' AS Data_nascimento, 'Roca Sales' AS Naturalidade, 'Andre da Silva' AS Nome_pai, '100.102.105-58' AS CPF_pai, 'Janete da Silva' AS Nome_mae, '222.111.458.85' AS CPF_mae, '' AS Segmento, '' AS Vendedor, 'Fornecedor' AS Tipo_Contato, '' AS Email_para_envio_NFe FROM PS_CLIENTES INNER JOIN PS_JURIDICA ON PS_CLIENTES.id_PS_JURIDICA = PS_JURIDICA.id_PS_JURIDICA INNER JOIN PS_PESSOA ON PS_JURIDICA.id_PS_PESSOA = PS_PESSOA.id_PS_PESSOA INNER JOIN PS_CIDADES ON PS_PESSOA.id_PS_CIDADES = PS_CIDADES.id_PS_CIDADES">
    </asp:SqlDataSource>
</asp:Content>
