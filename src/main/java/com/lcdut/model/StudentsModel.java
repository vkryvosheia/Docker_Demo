package com.lcdut.model;

import javax.persistence.*;
import java.io.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "students")
public class StudentsModel implements Externalizable {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "pib")
    private String pib;
    @Column(name = "id_group")
    private Integer idGroup;
    private String position;
    private String institute;
    private String educationLevel;
    private String trainingDirection;
    private String specialty;
    private Integer term;
    private Integer year;
    private Integer numOfTransfers;
    private String specialization;
    private String dateOfBirth;
    private String placeOfBirth;
    private String citizenship;
    private String graduated;
    private String familyStatus;
    private String addressOfResidence;
    private String privilegesForAdmission;
    private String enrolledOrder;
    private String competition;
    private String transferFrom;
    private String byDirection;
    private String specialConditions;
    private String outOfCompetition;
    private String termsOfFullCompensation;
    private String employmentHistory;
    private String taxes;
    private Integer currentYear;
    private String decrees;
    private String transfer_to_sec_year;
    private String transfer_to_third_year;
    private String transfer_to_fourth_year;

    public String getTransfer_to_sec_year() {
        return transfer_to_sec_year;
    }

    public void setTransfer_to_sec_year(String transfer_to_sec_year) {
        this.transfer_to_sec_year = transfer_to_sec_year;
    }

    public String getTransfer_to_third_year() {
        return transfer_to_third_year;
    }

    public void setTransfer_to_third_year(String transfer_to_third_year) {
        this.transfer_to_third_year = transfer_to_third_year;
    }

    public String getTransfer_to_fourth_year() {
        return transfer_to_fourth_year;
    }

    public void setTransfer_to_fourth_year(String transfer_to_fourth_year) {
        this.transfer_to_fourth_year = transfer_to_fourth_year;
    }

    public String getDecrees() {
        return decrees;
    }

    public void setDecrees(String decrees) {
        this.decrees = decrees;
    }

    public Integer getCurrentYear() {
        return currentYear;
    }

    public void setCurrentYear(Integer currentYear) {
        this.currentYear = currentYear;
    }
    //    @OneToMany
//    @JoinColumn(name="id", referencedColumnName = "id_stud")
//    private Set<MarksModel> marks;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public Integer getNumOfTransfers() {
        return numOfTransfers;
    }

    public void setNumOfTransfers(Integer numOfTransfers) {
        this.numOfTransfers = numOfTransfers;
    }

    public void setIdGroup(Integer idGroup) {
        this.idGroup = idGroup;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }


    public String getPib() {
        return pib;
    }

    public void setPib(String pib) {
        this.pib = pib;
    }


    public int getIdGroup() {
        return idGroup;
    }

    public void setIdGroup(int idGroup) {
        this.idGroup = idGroup;
    }

    @Basic
    @Column(name = "position")
    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    @Basic
    @Column(name = "institute")
    public String getInstitute() {
        return institute;
    }

    public void setInstitute(String institute) {
        this.institute = institute;
    }

    @Basic
    @Column(name = "education_level")
    public String getEducationLevel() {
        return educationLevel;
    }

    public void setEducationLevel(String educationLevel) {
        this.educationLevel = educationLevel;
    }

    @Basic
    @Column(name = "training_direction")
    public String getTrainingDirection() {
        return trainingDirection;
    }

    public void setTrainingDirection(String trainingDirection) {
        this.trainingDirection = trainingDirection;
    }

    @Basic
    @Column(name = "specialty")
    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    @Basic
    @Column(name = "specialization")
    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    @Basic
    @Column(name = "date_of_birth")
    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    @Basic
    @Column(name = "place_of_birth")
    public String getPlaceOfBirth() {
        return placeOfBirth;
    }

    public void setPlaceOfBirth(String placeOfBirth) {
        this.placeOfBirth = placeOfBirth;
    }

    @Basic
    @Column(name = "citizenship")
    public String getCitizenship() {
        return citizenship;
    }

    public void setCitizenship(String citizenship) {
        this.citizenship = citizenship;
    }

    @Basic
    @Column(name = "graduated")
    public String getGraduated() {
        return graduated;
    }

    public void setGraduated(String graduated) {
        this.graduated = graduated;
    }

    @Basic
    @Column(name = "family_status")
    public String getFamilyStatus() {
        return familyStatus;
    }

    public void setFamilyStatus(String familyStatus) {
        this.familyStatus = familyStatus;
    }

    @Basic
    @Column(name = "address_of_residence")
    public String getAddressOfResidence() {
        return addressOfResidence;
    }

    public void setAddressOfResidence(String addressOfResidence) {
        this.addressOfResidence = addressOfResidence;
    }

    @Basic
    @Column(name = "privileges_for_admission")
    public String getPrivilegesForAdmission() {
        return privilegesForAdmission;
    }

    public void setPrivilegesForAdmission(String privilegesForAdmission) {
        this.privilegesForAdmission = privilegesForAdmission;
    }

    @Basic
    @Column(name = "enrolled_order")
    public String getEnrolledOrder() {
        return enrolledOrder;
    }

    public void setEnrolledOrder(String enrolledOrder) {
        this.enrolledOrder = enrolledOrder;
    }

    @Basic
    @Column(name = "competition")
    public String getCompetition() {
        return competition;
    }

    public void setCompetition(String competition) {
        this.competition = competition;
    }

    @Basic
    @Column(name = "transfer_from")
    public String getTransferFrom() {
        return transferFrom;
    }

    public void setTransferFrom(String transferFrom) {
        this.transferFrom = transferFrom;
    }

    @Basic
    @Column(name = "by_direction")
    public String getByDirection() {
        return byDirection;
    }

    public void setByDirection(String byDirection) {
        this.byDirection = byDirection;
    }

    @Basic
    @Column(name = "special_conditions")
    public String getSpecialConditions() {
        return specialConditions;
    }

    public void setSpecialConditions(String specialConditions) {
        this.specialConditions = specialConditions;
    }

    @Basic
    @Column(name = "out_of_competition")
    public String getOutOfCompetition() {
        return outOfCompetition;
    }

    public void setOutOfCompetition(String outOfCompetition) {
        this.outOfCompetition = outOfCompetition;
    }

    @Basic
    @Column(name = "terms_of_full_compensation")
    public String getTermsOfFullCompensation() {
        return termsOfFullCompensation;
    }

    public void setTermsOfFullCompensation(String termsOfFullCompensation) {
        this.termsOfFullCompensation = termsOfFullCompensation;
    }

    @Basic
    @Column(name = "employment_history")
    public String getEmploymentHistory() {
        return employmentHistory;
    }

    public void setEmploymentHistory(String employmentHistory) {
        this.employmentHistory = employmentHistory;
    }

    @Basic
    @Column(name = "taxes")
    public String getTaxes() {
        return taxes;
    }

    public void setTaxes(String taxes) {
        this.taxes = taxes;
    }



    @Override
    public void writeExternal(ObjectOutput out) throws IOException {

    }

    @Override
    public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {

    }

//    public Set<MarksModel> getMarks() {
//        return marks;
//    }
//
//    public void setMarks(Set<MarksModel> marks) {
//        this.marks = marks;
//    }
}
