package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.base_gatos_demo.entities.Note;
import pt.upskill.base_gatos_demo.entities.Shift;
import pt.upskill.base_gatos_demo.entities.User;
import pt.upskill.base_gatos_demo.models.CreateNoteModel;
import pt.upskill.base_gatos_demo.models.EditNoteModel;
import pt.upskill.base_gatos_demo.repositories.NoteRepository;
import pt.upskill.base_gatos_demo.repositories.ShiftRepository;

import java.time.LocalDateTime;

@Service
public class NoteService {

    @Autowired
    NoteRepository noteRepository;
    @Autowired
    ShiftRepository shiftRepository;

    public void saveNote(Shift shift, String summary , String importantObservations) {
        Note note = new Note();
        note.setSummary(summary);
        note.setImportantObservations(importantObservations);
        note.setUpdatedAt(LocalDateTime.now());
        noteRepository.save(note);

        shift.getNotes().add(note);
        shiftRepository.save(shift);

    }

    public void saveExistingNote(Note note) {
        noteRepository.save(note);
    }

    /*public void createNote(CreateNoteModel model) {
        Note note = new Note();
        note.setPriority(model.getPriority());
        note.setUpdatedAt(LocalDateTime.now());
        note.setRead(false);
        note.setSummary(model.getSummary());
        note.setImportantObservations(model.getImportantObservations());
        noteRepository.save(note);
    }

    public void editNote(EditNoteModel model) {
        for (Note note : noteRepository.findAll()) {
            if(note.getShift().equals(model.getShift())) {
                note.setUpdatedAt(LocalDateTime.now());
                note.setRead(false);
                note.setSummary(model.getSummary());
                note.setImportantObservations(model.getImportantObservations());

            }
        }
    }*/

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