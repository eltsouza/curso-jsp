package beans;

public class BeanProduto {

	private String nome;
	private double quantidade;
	private double valor;
	private long codigo;
	private long categoria_id;
	
	public long getCategoria_id() {
		return categoria_id;
	}
	public void setCategoria_id(long categoria_id) {
		this.categoria_id = categoria_id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public double getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(double quantidade) {
		this.quantidade = quantidade;
	}
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}	
	public Long getCodigo() {
		return codigo;
	}
	public void setCodigo(long codigo) {
		this.codigo = codigo;
	}
	public String getValorEmTexto(){
		return Double.toString(valor).replace('.', ',');
	}
	
	
}
