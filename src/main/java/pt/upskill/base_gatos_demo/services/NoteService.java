package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pt.upskill.base_gatos_demo.entities.Announcement;
import pt.upskill.base_gatos_demo.entities.Note;
import pt.upskill.base_gatos_demo.entities.Shift;
import pt.upskill.base_gatos_demo.entities.User;
//import pt.upskill.base_gatos_demo.models.CreateNoteModel;
//import pt.upskill.base_gatos_demo.models.EditNoteModel;
import pt.upskill.base_gatos_demo.repositories.NoteRepository;
import pt.upskill.base_gatos_demo.repositories.ShiftRepository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class NoteService {

    @Autowired
    NoteRepository noteRepository;
    @Autowired
    ShiftRepository shiftRepository;

    public void startShift(Long id, User user) {
        Shift shift = shiftRepository.findById(id).orElse(null);
        if (shift != null && shift.getStartedAt() == null) {
            shift.setStartedAt(LocalDateTime.now());
            shift.setCurrentVolunteer(user);
            shiftRepository.save(shift);
        }
    }

    public void saveNote(Shift shift, String summary, String importantObservations) {
        Note note = new Note();
        note.setSummary(summary);
        note.setImportantObservations(importantObservations);
        note.setUpdatedAt(LocalDateTime.now());
        noteRepository.save(note);
        shift.getNotes().add(note);
        shiftRepository.save(shift);
    }

    public void saveNote(Long id, String summary, String importantObservations) {
        Shift shift = shiftRepository.findById(id).orElse(null);
        if (shift != null) {
            shift.setEndedAt(LocalDateTime.now());
            shift.setCurrentVolunteer(null);
            shiftRepository.save(shift);
            saveNote(shift, summary, importantObservations);
        }
    }

    public void readNote(Long shiftId) {
        Shift shift = shiftRepository.findById(shiftId).orElse(null);
        if (shift != null) {
            for (Note note : shift.getNotes()) {
                note.setRead(true);
                noteRepository.save(note);
            }
        }
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

    public List<Note> getNotes () {
        return noteRepository.findAll();
    }

    public List<Note> getFilteredNotes(LocalDate dateStartFilter, LocalDate dateEndFilter, String priorityFilter) {
        List<Note> notes = new ArrayList<>();
        if(dateStartFilter == null && dateEndFilter == null && (priorityFilter == null || priorityFilter.isEmpty())) {
            //não tem datas nem prioridade
            notes = noteRepository.findTop6ByOrderByUpdatedAtDesc();
        } else if(dateStartFilter == null && dateEndFilter == null && priorityFilter != null && !priorityFilter.isEmpty()) {
            //tem só prioridade
            notes = noteRepository.findByPriority(priorityFilter);
        } else if(dateStartFilter != null && dateEndFilter == null && (priorityFilter == null || priorityFilter.isEmpty())) {
            //tem só data de inicio
            notes = noteRepository.findByUpdatedAtAfter(dateStartFilter.atStartOfDay());
        } else if(dateStartFilter != null && dateEndFilter == null && priorityFilter != null && !priorityFilter.isEmpty()) {
            //tem data de início e prioridade
            notes = noteRepository.findByUpdatedAtAfterAndPriority(dateStartFilter.atStartOfDay(), priorityFilter);
        } else if(dateStartFilter == null && dateEndFilter != null && (priorityFilter == null || priorityFilter.isEmpty())) {
            //tem só data de fim
            notes = noteRepository.findByUpdatedAtBefore(dateEndFilter.atTime(23,59,59));
        } else if(dateStartFilter != null && dateEndFilter == null && priorityFilter != null && !priorityFilter.isEmpty()) {
            //tem só data de fim e prioridade
            notes = noteRepository.findByUpdatedAtBeforeAndPriority(dateEndFilter.atTime(23,59,59), priorityFilter);
        } else if(dateStartFilter != null && dateEndFilter != null && (priorityFilter == null || priorityFilter.isEmpty())) {
            //tem ambas as datas sem prioridade
            notes = noteRepository.findByUpdatedAtBetween(dateStartFilter.atStartOfDay(), dateEndFilter.atTime(23,59,59));
        } else if (dateStartFilter != null && dateEndFilter != null && priorityFilter != null && !priorityFilter.isEmpty()) {
            //tem ambas as datas com prioridade
            notes = noteRepository.findByUpdatedAtBetweenAndPriority(dateStartFilter.atStartOfDay(), dateEndFilter.atTime(23,59,59), priorityFilter);
        }
        notes.sort((a, b) -> b.getUpdatedAt().compareTo(a.getUpdatedAt()));
        return notes;
    }

}