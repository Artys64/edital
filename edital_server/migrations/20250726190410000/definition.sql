BEGIN;

--
-- Class User as table user
--
CREATE TABLE "user" (
    "id" bigserial PRIMARY KEY,
    "username" text NOT NULL UNIQUE,
    "passwordHash" text NOT NULL,
    "email" text NOT NULL UNIQUE,
    "role" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "user_username_idx" ON "user" USING btree ("username");
CREATE INDEX "user_email_idx" ON "user" USING btree ("email");

--
-- Class EvaluationCommittee as table evaluation_committees
--
CREATE TABLE "evaluation_committees" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone
);

--
-- Class CommitteeMember as table committee_members
--
CREATE TABLE "committee_members" (
    "id" bigserial PRIMARY KEY,
    "committeeId" bigint NOT NULL,
    "userId" bigint NOT NULL,
    "role" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "committee_members_committee_idx" ON "committee_members" USING btree ("committeeId");
CREATE INDEX "committee_members_user_idx" ON "committee_members" USING btree ("userId");
CREATE UNIQUE INDEX "committee_members_unique" ON "committee_members" USING btree ("committeeId", "userId");

--
-- Foreign relations for "committee_members" table
--
ALTER TABLE ONLY "committee_members"
    ADD CONSTRAINT "committee_members_fk_committee"
    FOREIGN KEY("committeeId")
    REFERENCES "evaluation_committees"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

ALTER TABLE ONLY "committee_members"
    ADD CONSTRAINT "committee_members_fk_user"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR edital
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('edital', '20250726190410000', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250726190410000', "timestamp" = now();

COMMIT;