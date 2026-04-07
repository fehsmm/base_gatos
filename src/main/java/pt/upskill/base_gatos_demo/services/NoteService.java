package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Note;
import pt.upskill.base_gatos_demo.entities.Shift;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.repositories.NoteRepository;

import java.time.LocalDateTime;

@Service
public class NoteService {

    @Autowired
    NoteRepository noteRepository;

    public Note getOrCreateNote(Shift shift) {
        Note note = noteRepository.findByShift(shift);
        if (note == null) {
            note = new Note();
            note.setShift(shift);
        }
        return note;
    }

    public void saveNote(Shift shift, String resumo, String ocorrencias) {
        Note note = getOrCreateNote(shift);
        note.setResumo(resumo);
        note.setOcorrencias(ocorrencias);
        note.setUpdatedAt(LocalDateTime.now());
        noteRepository.save(note);
    }

    public void saveExistingNote(Note note) {
        noteRepository.save(note);
    }

    public int countUnreadNotes() {
        int unreadNotes = 0;
        for(Note note : noteRepository.findAll()) {
            if(!note.isRead()) {
                unreadNotes++;
            }
        }
        return unreadNotes;
    }
}