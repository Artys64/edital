BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "evaluation_committees" (
    "id" bigserial PRIMARY KEY,
    "noticeId" bigint NOT NULL,
    "evaluatorId" bigint NOT NULL,
    "role" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "notices" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "startDate" timestamp without time zone NOT NULL,
    "endDate" timestamp without time zone NOT NULL,
    "status" text NOT NULL,
    "createdById" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "registrations" (
    "id" bigserial PRIMARY KEY,
    "noticeId" bigint NOT NULL,
    "candidateId" bigint NOT NULL,
    "status" text NOT NULL,
    "submissionDate" timestamp without time zone NOT NULL,
    "evaluationDate" timestamp without time zone,
    "evaluatorNotes" text,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "users" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "email" text NOT NULL,
    "password" text NOT NULL,
    "role" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "emailIdx" ON "users" USING btree ("email");


--
-- MIGRATION VERSION FOR edital
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('edital', '20250724195002174', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250724195002174', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
