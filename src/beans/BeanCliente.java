package beans;

public class BeanCliente {
	
	private Long id;
	private String cpf;
	private String rg;
	private String nome;
	private String profissao;
	private String email;
	private String dataNascimento;	
	private String fotobase64;
	private String fotobase64miniatura;
	private String contenttype;
	private String tempFotoUser;
	private boolean atualizarImage = true;
	private boolean ativo;
	private String sexo;
	private String origem;//variavel para controle
	
	
	public String getOrigem() {
		return origem;
	}
	public void setOrigem(String origem) {
		this.origem = origem;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getRg() {
		return rg;
	}
	public void setRg(String rg) {
		this.rg = rg;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getProfissao() {
		return profissao;
	}
	public void setProfissao(String profissao) {
		this.profissao = profissao;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDataNascimento() {
		return dataNascimento;
	}
	public void setDataNascimento(String dataNascimento) {
		this.dataNascimento = dataNascimento;
	}
	public String getFotobase64() {
		return fotobase64;
	}
	public void setFotobase64(String fotobase64) {
		this.fotobase64 = fotobase64;
	}
	public String getTempFotoUser() {
		tempFotoUser = "data:" + contenttype + ";base64," + fotobase64;
		return tempFotoUser;
	}
	public String getContenttype() {
		return contenttype;
	}
	public void setContenttype(String contenttype) {
		this.contenttype = contenttype;
	}
	public void setTempFotoUser(String tempFotoUser) {
		this.tempFotoUser = tempFotoUser;
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
	
	public String getFotobase64miniatura() {
		return fotobase64miniatura;
	}
	
	public void setFotobase64miniatura(String fotobase64miniatura) {
		this.fotobase64miniatura = fotobase64miniatura;
	}
	
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	
	
}
