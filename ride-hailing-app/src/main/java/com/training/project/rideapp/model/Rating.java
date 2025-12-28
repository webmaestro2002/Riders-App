package com.training.project.rideapp.model;

import jakarta.persistence.*;


@Entity
@Table(name = "ratings")
public class Rating {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int stars;

    private String comment;

    @ManyToOne
    @JoinColumn(name = "ride_id")
    private Ride ride;

    @ManyToOne
    @JoinColumn(name = "given_by")
    private User givenBy;

    @ManyToOne
    @JoinColumn(name = "given_to")
    private User givenTo;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public int getStars() { return stars; }
    public void setStars(int stars) { this.stars = stars; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public Ride getRide() { return ride; }
    public void setRide(Ride ride) { this.ride = ride; }

    public User getGivenBy() { return givenBy; }
    public void setGivenBy(User givenBy) { this.givenBy = givenBy; }

    public User getGivenTo() { return givenTo; }
    public void setGivenTo(User givenTo) { this.givenTo = givenTo; }
}
