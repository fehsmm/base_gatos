package pt.upskill.base_gatos_demo.entities;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
public class Note {
    @Id
    @GeneratedValue
    private Long id;

    @OneToOne
    @JoinColumn(name = "shift_id")
    private Shift shift;

    private String resumo;
    private String ocorrencias;
    private LocalDateTime updatedAt;
    private String priority;

    @Column(name = "is_read")
    private boolean read = false;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Shift getShift() { return shift; }
    public void setShift(Shift shift) { this.shift = shift; }

    public String getResumo() { return resumo; }
    public void setResumo(String resumo) { this.resumo = resumo; }

    public String getOcorrencias() { return ocorrencias; }
    public void setOcorrencias(String ocorrencias) { this.ocorrencias = ocorrencias; }

    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }

    public boolean isRead() { return read; }
    public void setRead(boolean read) { this.read = read; }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }
}