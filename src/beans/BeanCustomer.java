package beans;

public class BeanCustomer {
	
	private String nome;
	private String cpf;
	private String sexo;
	private String rg;
	private String email;
	private String dataNascimento;
	private Long id;
	private String profissao;
	private String rua;
	private String fotobase64;
	private String fotobase64miniatura;
	private String contenttype;
	private String tempFotoUser;
	private boolean atualizarImage = true;
	private boolean ativo;

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

	public Long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
}
