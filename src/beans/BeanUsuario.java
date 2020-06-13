package beans;

public class BeanUsuario {

	private String nome;
	private String ano;
	private String sexo;
	private String login;
	private String senha;
	private String fone;
	private Long id;
	private String cep;
	private String rua;
	private String bairro;
	private String cidade;
	private String estado;
	private String ibge;	
	private String fotobase64;
	private String fotobase64miniatura;
	private String contenttype;
	private String tempFotoUser;
	private String curriculobase64;
	private String contenttypecurriculo;
	private boolean atualizarImage = true;
	private boolean atualizarPdf = true;
	private boolean ativo;
	private String perfil;

	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}
	
	public String getPerfil() {
		return perfil;
	}
	
	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	
	public boolean isAtualizarImage() {
		return atualizarImage;
	}

	public void setAtualizarImage(boolean atualizarImage) {
		this.atualizarImage = atualizarImage;
	}

	public boolean isAtualizarPdf() {
		return atualizarPdf;
	}

	public void setAtualizarPdf(boolean atualizarPdf) {
		this.atualizarPdf = atualizarPdf;
	}

	public String getFotobase64miniatura() {
		return fotobase64miniatura;
	}
	
	public void setFotobase64miniatura(String fotobase64miniatura) {
		this.fotobase64miniatura = fotobase64miniatura;
	}
	
	public String getContenttypecurriculo() {
		return contenttypecurriculo;
	}

	public void setContenttypecurriculo(String contenttypecurriculo) {
		this.contenttypecurriculo = contenttypecurriculo;
	}

	public String getCurriculobase64() {
		return curriculobase64;
	}

	public void setCurriculobase64(String curriculobase64) {
		this.curriculobase64 = curriculobase64;
	}

	public String getTempFotoUser() {
		tempFotoUser = "data:" + contenttype + ";base64," + fotobase64;
		return tempFotoUser;
	}
	
	public String getFotobase64() {
		return fotobase64;
	}

	public void setFotobase64(String fotobase64) {
		this.fotobase64 = fotobase64;
	}

	public String getContenttype() {
		return contenttype;
	}

	public void setContenttype(String contenttype) {
		this.contenttype = contenttype;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getIbge() {
		return ibge;
	}

	public void setIbge(String ibge) {
		this.ibge = ibge;
	}

	public Long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getNome() {
		return nome;
	}
	
	/*
	 * <%= calcula.calcula(100) %> usado para chamar o metodo calcula do bean dentro
	 * do jsp
	 */

	public String getFone() {
		return fone;
	}

	public void setFone(String fone) {
		this.fone = fone;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getAno() {
		return ano;
	}

	public void setAno(String ano) {
		this.ano = ano;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public int calcula(int numero) {
		return numero * 100;
	}

}
