package pe.edu.pucp.lab10.Dtos;

import java.math.BigDecimal;

public class SalarioPorDepartamentoDto {

    private String nombreDepartamento;
    private BigDecimal salarioMinimo;
    private BigDecimal salarioMaximo;
    private BigDecimal salarioPromedio;

    public String getNombreDepartamento() {
        return nombreDepartamento;
    }

    public void setNombreDepartamento(String nombreDepartamento) {
        this.nombreDepartamento = nombreDepartamento;
    }

    public BigDecimal getSalarioMinimo() {
        return salarioMinimo;
    }

    public void setSalarioMinimo(BigDecimal salarioMinimo) {
        this.salarioMinimo = salarioMinimo;
    }

    public BigDecimal getSalarioMaximo() {
        return salarioMaximo;
    }

    public void setSalarioMaximo(BigDecimal salarioMaximo) {
        this.salarioMaximo = salarioMaximo;
    }

    public BigDecimal getSalarioPromedio() {
        return salarioPromedio;
    }

    public void setSalarioPromedio(BigDecimal salarioPromedio) {
        this.salarioPromedio = salarioPromedio;
    }
}
