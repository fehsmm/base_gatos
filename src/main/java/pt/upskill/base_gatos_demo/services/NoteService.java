package pt.upskill.base_gatos_demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;
import pt.upskill.base_gatos_demo.entities.*;
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
        //carrega o shift e guarda a nota, função auxiliar
        Note note = new Note();
        note.setSummary(summary);
        note.setImportantObservations(importantObservations);
        note.setUpdatedAt(LocalDateTime.now());
        note.setRead(false);
        noteRepository.save(note);
        shift.getNotes().add(note);
        shiftRepository.save(shift);
    }

    public void saveNote(Long id, String summary, String importantObservations) {
        //vai buscar o turno, define a data de fim, limpa a lista de voluntários e chama o save note para salvar a nota do turno anterior
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

    public List<Note> getFilteredNotes(LocalDate dateStartFilter, LocalDate dateEndFilter, String priorityFilter, Boolean unreadFilter) {
        List<Note> notes = new ArrayList<>();
        if(dateStartFilter == null && dateEndFilter == null &&
                (priorityFilter == null || priorityFilter.isEmpty()) && (unreadFilter == null || !unreadFilter)) {
            //não tem nada
            notes = noteRepository.findTop6ByOrderByUpdatedAtDesc();
        } else if(dateStartFilter == null && dateEndFilter == null &&
                priorityFilter != null && !priorityFilter.isEmpty() && (unreadFilter == null || !unreadFilter)) {
            //tem só prioridade
            notes = noteRepository.findByPriority(priorityFilter);
        } else if(dateStartFilter != null && dateEndFilter == null &&
                (priorityFilter == null || priorityFilter.isEmpty()) && (unreadFilter == null || !unreadFilter)) {
            //tem só data de inicio
            notes = noteRepository.findByUpdatedAtAfter(dateStartFilter.atStartOfDay());
        } else if (dateStartFilter == null && dateEndFilter == null &&
                (priorityFilter == null || priorityFilter.isEmpty()) && (unreadFilter != null && unreadFilter)) {
            //tem só unread
            notes = noteRepository.findByReadFalse(unreadFilter);
        } else if(dateStartFilter == null && dateEndFilter != null &&
                (priorityFilter == null || priorityFilter.isEmpty()) && (unreadFilter == null || !unreadFilter)) {
            //tem só data de fim
            notes = noteRepository.findByUpdatedAtBefore(dateEndFilter.atTime(23,59,59));
        } else if(dateStartFilter != null && dateEndFilter == null &&
                priorityFilter != null && !priorityFilter.isEmpty() && (unreadFilter == null || !unreadFilter)) {
            //tem data de início e prioridade
            notes = noteRepository.findByUpdatedAtAfterAndPriority(dateStartFilter.atStartOfDay(), priorityFilter);
        } else if (dateStartFilter != null && dateEndFilter == null &&
                (priorityFilter == null || priorityFilter.isEmpty()) && (unreadFilter != null && unreadFilter)) {
            //tem data de inicio e unread
            notes = noteRepository.findByUpdatedAtAfterAndReadFalse(dateStartFilter.atStartOfDay(), unreadFilter);
        } else if(dateStartFilter != null && dateEndFilter != null &&
                (priorityFilter == null || priorityFilter.isEmpty()) && (unreadFilter == null || !unreadFilter)) {
            //tem date de inicio e data de fim
            notes = noteRepository.findByUpdatedAtBetween(dateStartFilter.atStartOfDay(), dateEndFilter.atTime(23,59,59));
        } else if(dateStartFilter == null && dateEndFilter != null &&
                priorityFilter != null && !priorityFilter.isEmpty() && (unreadFilter == null || !unreadFilter)) {
            //tem data de fim e prioridade
            notes = noteRepository.findByUpdatedAtBeforeAndPriority(dateEndFilter.atTime(23, 59, 59), priorityFilter);
        } else if (dateStartFilter == null && dateEndFilter != null &&
                (priorityFilter == null || priorityFilter.isEmpty()) && (unreadFilter != null && unreadFilter)) {
            //tem data de fim e unread
            notes = noteRepository.findByUpdatedAtBeforeAndReadFalse(dateEndFilter.atTime(23,59,59), unreadFilter);
        } else if (dateStartFilter == null && dateEndFilter == null
                && priorityFilter != null && !priorityFilter.isEmpty() && (unreadFilter != null && unreadFilter)) {
            //tem unread e prioridade
            notes = noteRepository.findByPriorityAndReadFalse(priorityFilter, unreadFilter);
        } else if (dateStartFilter != null && dateEndFilter != null &&
                priorityFilter != null && !priorityFilter.isEmpty() && (unreadFilter == null || !unreadFilter)) {
            //tem ambas as datas com prioridade
            notes = noteRepository.findByUpdatedAtBetweenAndPriority(dateStartFilter.atStartOfDay(), dateEndFilter.atTime(23,59,59), priorityFilter);
        } else if (dateStartFilter != null && dateEndFilter != null &&
                (priorityFilter == null || priorityFilter.isEmpty()) && (unreadFilter != null && unreadFilter)) {
            //tem ambas as datas com unread
            notes = noteRepository.findByUpdatedAtBetweenAndReadFalse(dateStartFilter.atStartOfDay(), dateEndFilter.atTime(23,59,59), unreadFilter);
        } else if (dateStartFilter != null && dateEndFilter == null &&
                priorityFilter != null && !priorityFilter.isEmpty() && (unreadFilter != null && unreadFilter)) {
            //inicio prioridade unread
            notes = noteRepository.findByUpdatedAtAfterAndPriorityAndReadFalse(dateStartFilter.atStartOfDay(), priorityFilter, unreadFilter);
        } else if (dateStartFilter == null && dateEndFilter != null &&
                priorityFilter != null && !priorityFilter.isEmpty() && (unreadFilter != null && unreadFilter)) {
            //fim prioridade unread
            notes = noteRepository.findByUpdatedAtBeforeAndPriorityAndReadFalse(dateEndFilter.atTime(23,59,59), priorityFilter, unreadFilter);
        } else if (dateStartFilter != null && dateEndFilter != null &&
                priorityFilter != null && !priorityFilter.isEmpty() && (unreadFilter != null && unreadFilter)) {
            //tem tudo
            notes = noteRepository.findByUpdatedAtBetweenAndPriorityAndReadFalse(dateStartFilter.atStartOfDay(), dateEndFilter.atTime(23,59,59), priorityFilter, unreadFilter);
        }
        notes.sort((a, b) -> b.getUpdatedAt().compareTo(a.getUpdatedAt()));
        return notes;
    }

    @Transactional
    public void markAsRead(Long id) {
        Note note = noteRepository.findById(id).orElse(null);
        if(note != null){
            note.setRead(true);
        }
    }
}